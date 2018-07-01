require "nexy/irc/version"
require 'cinch'
require 'require_all'
require 'nexy/irc/plugins'

module Nexy
  module Irc
    class Bot
      attr_reader :bot, :bot_config

      def initialize
        puts 'Creating a new bot'
        require_relative '../../config/initializers/database'

        Nexy::Irc::Initialize::Database.set_up
        @bot_config = bot_config
        @bot = create_bot
      end

      def start
        bot.start
      end

      private

      def create_bot
        plugins = get_plugins
        config = bot_config
        Cinch::Bot.new do
          configure do |c|
            c.server   = config[:server]
            c.port     = config[:port]
            c.ssl.use  = config[:ssl] == 'true'
            c.channels = config[:channels]
            c.nick     = config[:nick]
            c.realname = config[:realname]
            c.user     = config[:user]
            c.plugins.plugins = plugins
          end

          on :message, "hello" do |m|
            m.reply "Hello, World"
          end
        end
      end

      def bot_config
        @bot_config ||= begin
          require_relative '../../config/config'
          Nexy::Irc::Config.bot_config
        end
      end

      def get_plugins
        plugin_names = Nexy::Irc::Plugins.constants - [:Base] # Ignore the base plugin class
        base        = 'Nexy::Irc::Plugins::'

        plugin_names.map { |plugin| (base + plugin.to_s).constantize }
      end
    end
  end
end
