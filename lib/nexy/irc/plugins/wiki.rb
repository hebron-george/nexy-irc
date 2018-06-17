require 'nexy/irc/plugins/base'

module Nexy::Irc::Plugins
  class Wiki < Base
    include Cinch::Plugin

    match 'wiki'
    def execute(m)
      m.reply "Will search for something on wikipedia here"
    end
  end
end