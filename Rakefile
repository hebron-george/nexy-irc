require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'standalone_migrations'
require 'require_all'
require_relative 'config/initializers/database'

Nexy::Irc::Initialize::Database.set_up

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

StandaloneMigrations::Tasks.load_tasks
