require 'cinch'

module Nexy::Irc
  module Plugins
    # All Nexy plugins should inherit from this class.
    # Common behaviors defined here.
    class Base

      # Given a +message+, strips out the
      # command and returns an array of the remaining
      # arguments.
      #
      # e.g. my_plugin.arguments("!wiki gob bluth")
      #   # => ["gob", "bluth"]
      #
      # If the message doesn't have any arguments,
      # returns an empty array
      #
      # e.g. my_plugin.get_arguments("!wiki")
      #   # => []
      def arguments(message)
        message.strip!

        arguments = message.split
        arguments.shift # Removes the command (e.g. '!wiki')

        return [] if arguments.nil?

        arguments
      end
    end
  end
end
