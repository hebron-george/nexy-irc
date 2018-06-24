require 'nexy/irc/plugins/base'

module Nexy::Irc::Plugins
  class Roll < Base
    include Cinch::Plugin

    # !roll
    #
    # Chooses a random number between 1 and 100 if no argument is provided.
    # Chooses a random number between 1 and the argument provided if argument is a whole number greater than 0.
    # Chooses 0 if the argument provided is 0.
    match /roll(\s\d+)?$/
    def execute(m)
      roll_max_value = arguments(m.message)[0]

      if roll_max_value == nil
        rolled_number = roll
      else
        roll_max_value = Integer(roll_max_value)

        if roll_max_value == 0
          rolled_number = 0
        else
          rolled_number = roll(Integer(roll_max_value))
        end
      end

      m.reply("You rolled #{rolled_number}", true)
    end

    private

    # Chooses a random number between 1 and max_roll_value
    def roll(max_roll_value = 100)
      1 + rand(max_roll_value)
    end
  end
end