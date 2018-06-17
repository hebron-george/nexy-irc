require 'nexy/irc/plugins/base'

module Nexy::Irc::Plugins
  class Quote < Base
    include Cinch::Plugin

    match 'quote'
    def execute(m)
      m.reply "Will search for a random quote here"
    end
  end
end