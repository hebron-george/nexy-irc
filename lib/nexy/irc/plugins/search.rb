require 'nexy/irc/plugins/base'
require 'duckduckgo'

module Nexy::Irc::Plugins
  class Search < Base
    include Cinch::Plugin

    # !search <items>
    #
    #  a random item
    match /search .*/
    def execute(m)
      search_term = arguments(m.message).join(' ')
      results = DuckDuckGo::search(:query => search_term)
      result = results.first

      link = get_url(result.uri)
      link = error_message('URL is too long to paste') if link.length + result.title.length > 435

      m.reply "#{result.title} | #{underline(link)}"
    end

    private

    def get_url(uri)
      CGI.unescape(uri.split('ddg=')[1])
    end
  end
end