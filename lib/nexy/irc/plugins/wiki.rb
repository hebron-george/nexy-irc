require 'nexy/irc/plugins/base'

module Nexy::Irc::Plugins
  class Wiki < Base
    include Cinch::Plugin

    # !wiki <search term>
    #
    # Uses the `wikipedia-client` gem
    # https://rubygems.org/gems/wikipedia-client
    # https://github.com/kenpratt/wikipedia-client
    #
    # Will display a description of the search term
    # along with a link to the Wikipedia page.
    match /wiki .*/
    def execute(m)
      search_term = search_term(m.message)

      display_help(m) && return if search_term.empty?

      search_wikipedia(search_term, m)
    end

    private

    def search_term(message)
      arguments(message).join(' ')
    end

    def display_help(m)
      m.reply error_message('Enter a search term, for example:')
      m.reply "!wiki #{fun_search_term}"
    end

    def search_wikipedia(search_term, m)
      require 'wikipedia'
      page = Wikipedia.find(search_term)

      summary = page_summary(page)

      m.reply summary unless summary.nil?
      m.reply page.fullurl
    end

    def page_summary(page)
      return if page.summary.nil?

      page.summary[0...300] + '...'
    end

    def fun_search_term
      [
          'Special Theory of Relativity',
          'Isaac Asimov',
          'Carl Sagan',
          'Mohanlal',
          'Synthwave',
          'Heligoland',
          'Indian Tea Culture',
          'The Theory and Practice of Oligarchical Collectivism',
          'Albus Dumbeldore',
          'Sea Turtle',
          ''
      ].sample
    end
  end
end