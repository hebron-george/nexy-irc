require 'nexy/irc/plugins/base'

module Nexy::Irc::Plugins
  class Roll < Base
    include Cinch::Plugin

    # !roll <number>
    #
    # Picks a random number in range
    match /roll/
    def execute(m)
      #things_to_choose_from = arguments(m.message)

      chosen_thing = roll()

      m.reply "Result: #{chosen_thing}"
    end

    private

    #Choose random number from 1 to 100
    def roll(maxRangeValue = 100)
      1 + rand(maxRangeValue)
    end
  end
end