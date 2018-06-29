require 'nexy/irc/plugins/base'

module Nexy::Irc::Plugins
  class Quote < Base
    include Cinch::Plugin

    match 'quote'
    def execute(m)
      offset = rand(::Quote.count)

      random_quote = ::Quote.offset(offset).first

      m.reply random_quote.quote
    end
  end
end