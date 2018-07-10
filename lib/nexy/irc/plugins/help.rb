require 'nexy/irc/plugins/base'

module Nexy::Irc::Plugins
  class Help < Base
    include Cinch::Plugin

    match 'help'
    def execute(m)
      standard_plugin_names   = Nexy::Irc::Plugins.constants - [:Base, :Privileged]
      names = standard_plugin_names.map { |name|
        "!" + name.to_s
      }

      m.reply "Available commands: " + names.join(', ')
    end
  end
end