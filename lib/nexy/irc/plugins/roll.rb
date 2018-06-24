require 'nexy/irc/plugins/base'

module Nexy::Irc::Plugins
  class Roll < Base
    include Cinch::Plugin

    # !roll
    #
    # Chooses a random number between 1 and 100
    match /roll/
    def execute(m)
      rolled_number = roll

      m.reply("You rolled #{rolled_number}", true)
    end

    private

    # Chooses a random number between 1 and max_roll_value
    def roll(max_roll_value = 100)
      1 + rand(max_roll_value)
    end
  end
end