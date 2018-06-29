require 'active_record'
require 'standalone_migrations'

module Nexy::Irc::Initialize
  module Database
    def self.set_up
      ActiveRecord::Base.establish_connection(db_config[current_environment])
      require_all 'app/models'
    end

    def self.db_config
      db_file = File.join(File.expand_path('..', __FILE__), '..', '..', 'db', 'config.yml')
      YAML.load(File.read(db_file))
    end

    def self.current_environment
      ENV['environment'] || 'development'
    end
  end
end