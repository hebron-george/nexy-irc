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

      # Formats a string to look like an error message
      # i.e. bolds and colors the string red.
      def error_message(message)
        Format(:red, bold_message(message))
      end

      # Formats a string to look like a success message
      # i.e. bolds and colors the string green
      def success_message(message)
        Format(:green, bold_message(message))
      end

      # Formats a string to be underlined
      def underline_message(message)
        Format(:underline, message)
      end
      alias_method :underline, :underline_message

      # Formats a string to be bolded
      def bold_message(message)
        Format(:bold, message)
      end
      alias_method :bold, :bold_message
    end
  end
end
