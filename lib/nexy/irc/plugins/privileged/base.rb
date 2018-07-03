require 'nexy/irc/plugins/base'

module Nexy::Irc::Plugins::Privileged
  class Base < Nexy::Irc::Plugins::Base
    def authorized_user?(user)
      # require 'pry'; binding.pry
      user.authname && user.authname.to_s == 'test_auth_name'
    end
  end
end
