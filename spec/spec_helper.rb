require 'bundler/setup'
require 'nexy/irc'
require 'cinch/test'
require_relative '../config/initializers/database'

ENV['environment'] = 'test'
Nexy::Irc::Initialize::Database.set_up

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
