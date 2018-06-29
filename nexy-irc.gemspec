
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nexy/irc/version"

Gem::Specification.new do |spec|
  spec.name          = "nexy-irc"
  spec.version       = Nexy::Irc::VERSION
  spec.authors       = ["Hebron George"]
  spec.email         = ["hebrontgeorge@gmail.com"]

  spec.summary       = %q{}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_development_dependency 'pry'

  spec.add_dependency 'cinch'
  spec.add_dependency 'crypt'
  spec.add_dependency 'wikipedia-client'
  spec.add_dependency 'duckduckgo'

  spec.add_dependency 'activerecord'
  spec.add_dependency 'standalone_migrations'
  spec.add_dependency 'sqlite3', '~> 1.3', '>= 1.3.11'

  spec.add_dependency 'require_all'
end
