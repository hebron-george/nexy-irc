require 'nexy/irc/plugins/base'

module Nexy::Irc::Plugins
  class Cryptocurrency < Base
    include Cinch::Plugin

    # !crypto <symbol>
    #
    # Returns some info on the
    # <symbol> cryptocurrency
    match /crypto .*/
    def execute(m)

    end

    private


  end
end
