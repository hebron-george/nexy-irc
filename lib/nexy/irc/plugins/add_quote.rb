require 'nexy/irc/plugins/base'

module Nexy::Irc::Plugins
  class AddQuote < Base
    include Cinch::Plugin

    match 'addquote'
    def execute(m)
      m.reply "Will add quote to some db here"
    end
  end
end