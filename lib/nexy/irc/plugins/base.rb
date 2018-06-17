require 'cinch'

module Nexy::Irc
  module Plugins
    # All Nexy plugins should
    # inherit from this class.
    # Common behaviors defined
    # here.
    class Base
      include Cinch::Plugin
    end
  end
end
