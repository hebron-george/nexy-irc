require "nexy/irc/version"
require 'cinch'
require 'require_all'
require 'nexy/irc/plugins'

module Nexy
  module Irc
    class Bot
      def initialize
        puts 'Creating a new bot'
        require_relative '../../config/initializers/database'

        Nexy::Irc::Initialize::Database.set_up
      end

      def start
        plugins = get_plugins
        bot = Cinch::Bot.new do
          configure do |c|
            c.server   = 'irc.freenode.net'
            # c.port     = '6669'
            c.channels = ['#nexy']
            c.nick     = 'nexy'
            c.realname = 'nexy'
            c.user     = 'nexy'
            c.plugins.plugins = plugins
            # c.ssl.use  = true
          end

          on :message, "hello" do |m|
            m.reply "Hello, World"
          end
        end

        bot.start
      end

      private

      def get_plugins
        plugin_names = Nexy::Irc::Plugins.constants - [:Base] # Ignore the base plugin class
        base        = 'Nexy::Irc::Plugins::'

        plugin_names.map { |plugin| (base + plugin.to_s).constantize }
      end
    end
  end
end
