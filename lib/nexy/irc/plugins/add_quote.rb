require 'nexy/irc/plugins/base'

module Nexy::Irc::Plugins
  class AddQuote < Base
    include Cinch::Plugin

    match /addquote .*/
    def execute(m)
      quote = arguments(m.message).join(' ')

      new_quote = ::Quote.new(quote: quote)
      new_quote.save!

      m.reply 'Added new quote!'
    end
  end
end