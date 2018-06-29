require "nexy/irc/version"
require 'cinch'
require 'nexy/irc/helpers/blowfish_translator'
require 'nexy/irc/plugins/help'
require 'nexy/irc/plugins/wiki'
require 'nexy/irc/plugins/add_quote'
require 'nexy/irc/plugins/quote'
require 'nexy/irc/plugins/rand'
require 'nexy/irc/plugins/roll'
require 'nexy/irc/plugins/search'

module Nexy
  module Irc
    class Bot
      def initialize
        puts 'Creating a new bot'
        require_relative '../../config/initializers/database'

        Nexy::Irc::Initialize::Database.set_up
      end

      def start
        bot = Cinch::Bot.new do
          configure do |c|
            c.server   = 'irc.freenode.net'
            # c.port     = '6669'
            c.channels = ['#nexy']
            c.nick     = 'nexy'
            c.realname = 'nexy'
            c.user     = 'nexy'
            c.plugins.plugins = [Nexy::Irc::Plugins::Help,
                                 Nexy::Irc::Plugins::Wiki,
                                 Nexy::Irc::Plugins::AddQuote,
                                 Nexy::Irc::Plugins::Quote,
                                 Nexy::Irc::Plugins::Rand,
                                 Nexy::Irc::Plugins::Roll,
                                 Nexy::Irc::Plugins::Search,
                                ] # TODO: Use get_plugins here instead
            # c.ssl.use  = true
          end

          on :message, "hello" do |m|
            m.reply "Hello, World"
          end

          # on :message, /\+OK.*/ do |m|
          #   new_decrypted = Blowfish.new_decrypt(m.message)
          #   p "this is the new_decrypted message: #{new_decrypted}"
          #   m.reply "This is new decrypted: #{new_decrypted}"
          #
          #   # old_decrypted = Blowfish.decrypt('testkey', m.message)
          #   # p "This is the old_decrypted message: #{old_decrypted}"
          #   # m.reply "This is what I decrypted: #{old_decrypted}"
          #   # m.reply "There was an error: #{e}"
          # end
        end

        bot.start
      end

      def get_plugins
        # TODO: get plugins and pass
        # them into config.plugins.plugins
        # as an array
      end
    end
  end
end
