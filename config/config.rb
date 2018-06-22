require 'yaml'

module Nexy::Irc::Config
  def self.bot
    # Default values
    {

    }.merge(bot_config_file)
  end

  def self.bot_config_file
    file_path = File.join(__dir__, 'bot.yml')
    return {} unless File.file?(file_path)
  end
end