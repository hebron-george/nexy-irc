require 'nexy/irc/plugins/base'

module Nexy::Irc::Plugins
  class Rand < Base
    include Cinch::Plugin

    # !rand <items>
    #
    # Picks a random item
    match /rand .*/
    def execute(m)
      things_to_choose_from = arguments(m.message)

      chosen_thing = choose_from_things(things_to_choose_from)

      m.reply "Result: #{chosen_thing}"
    end

    private

    # Given an array of items, chooses
    # one randomly and returns them
    #
    # e.g. !rand a b c
    #   # => c
    def choose_from_things(array_of_items)
      # Put your logic here
    end
  end
end