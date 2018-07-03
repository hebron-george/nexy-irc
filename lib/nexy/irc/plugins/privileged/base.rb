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
      # require 'pry'; binding.pry
      user.authname && user.authname.to_s == 'test_auth_name'
    end
  end
end
