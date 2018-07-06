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
    #
    # E.g. if you want only admins to be able to run it:
    #   def required_level
    #     :admin
    #   end
    #
    # or if you want someone with medium or higher to be
    # able to run it:
    #   def required_level
    #     :medium
    #   end
    def required_user_level
      error "Required user level not implemented for Plugin: #{self.class.name}"
      error raise NotImplementedError
    end

    def authorized_user?(user)
      return false unless valid_required_level?

      return true if required_user_level == :anyone

      plugin_level = required_user_level
      user         = User.where(auth_name: user.authname).first

      return false if user.nil?

      user_level = user.user_level.level

      user_level >= user_level_mapping[plugin_level.to_sym]
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

    def valid_required_level?
      user_level_mapping.keys.include? required_user_level
    end
  end
end
