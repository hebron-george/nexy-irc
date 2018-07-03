require 'nexy/irc/plugins/base'

module Nexy::Irc::Plugins::Privileged
  class Base < Nexy::Irc::Plugins::Base

    # Each privileged plugin must implement
    # this method, which returns the minimum
    # user level required to be able to carry
    # out the execution of the plugin.
    #
    # Possible user levels (highest to lowest)
    #   :admin
    #   :high
    #   :medium
    #   :low
    #   :anyone
    def user_level
      raise NotImplementedError
    end

    def authorized_user?(user)
      # u = User.where(auth_name: user.authname).first
      # return if u.nil?
      #
      # level = u.user_level.level.to_sym
      # user_level >= user_level_mapping[level]
      user.authname && user.authname.to_s == 'test_auth_name'
    end

    private

    def user_level_mapping
      {
        admin:  9999,
        high:   10,
        medium: 8,
        low:    6,
        anyone: 1
      }
    end
  end
end
