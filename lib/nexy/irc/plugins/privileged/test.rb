require 'nexy/irc/plugins/privileged/base'

module Nexy::Irc::Plugins::Privileged
  class Test < Base
    include Cinch::Plugin

    match 'test'
    def execute(m)
      if authorized_user?(m.user)
        m.reply success_message("#{m.user} can use this commend!")
      else
        m.reply error_message("#{m.user} cannot use this command!")
      end
    end
  end
end
