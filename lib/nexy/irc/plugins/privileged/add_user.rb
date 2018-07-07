require 'nexy/irc/plugins/privileged/base'

module Nexy::Irc::Plugins::Privileged
  class AddUser < Base
    include Cinch::Plugin

    match /adduser .*/
    def execute(m)
      return unless authorized_user?(m.user)
      args  = arguments(m.message)
      user  = args.first
      level = args.second

      return command_structure(m)            unless valid_user_and_level?(user, level)
      return user_needs_to_register(m, user) unless registered_user?(user)

      add_user(user, level)
      m.reply success_message("#{user} has been added with #{level} permissions")
    end

    def required_user_level
      :admin
    end

    private

    def command_structure(m)
      m.reply error_message('The user and level specified are not valid.')
      m.reply success_message('Command: ') + '!adduser <user> <level>'
    end

    def user_needs_to_register(m, user)
      m.reply "#{user} is not registered with the network so I cannot add them."
    end

    def valid_user_and_level?(user, level)
      return false if invalid_user?(user)
      return false if invalid_level?(level)

      true
    end

    def invalid_user?(user)
      return true if user.nil?
      return true if user.blank?

      false
    end

    def invalid_level?(level)
      return true if level.nil?
      return true if level.blank?

      valid_levels = UserLevel.all.map(&:title).map(&:to_sym)
      !valid_levels.include? level.to_sym
    end

    def registered_user?(user)
      User(user).authname.present?
    end

    def add_user(user, level)
      auth_name  = User(user).authname
      host_name  = User(user).host
      user_level = UserLevel.where(title: level).first

      User.where(auth_name: auth_name, user_level: user_level, host_mask: host_name).first_or_create!
    end
  end
end
