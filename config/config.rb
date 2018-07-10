require 'yaml'
require 'active_support/core_ext/hash/indifferent_access'

module Nexy::Irc::Config
  def self.bot_config
    # Default values
    {
      server:   'irc.freenode.net',
      port:     '6667',
      ssl:      false,
      channels: ['#nexy'],
      user:     'nexy',
      nick:     'nexy',
      realname: 'nexy',
    }.merge(YAML.load(bot_config_from_file)).with_indifferent_access
  end

  def self.bot_config_from_file
    file_path = File.join(__dir__, 'bot.yml')
    return '{}' unless File.file?(file_path)

    File.open(file_path).read
  end
end
