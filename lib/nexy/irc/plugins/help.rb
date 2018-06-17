require 'nexy/irc/plugins/base'

module Nexy::Irc::Plugins
  class Help < Base
    include Cinch::Plugin

    match 'help'
    def execute(m)
      m.reply "A help message will go here"
    end
  end
end