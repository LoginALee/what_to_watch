# frozen_string_literal: true

require_relative "lib/what_to_watch_today/version"

Gem::Specification.new do |spec|
  spec.name          = "what_to_watch_today"
  spec.version       = WhatToWatchToday::VERSION
  spec.authors       = ["Jorge Vargas"]
  spec.email         = ["jvargas18@ucol.mx"]

  spec.summary       = "What to wath is a gem for movies and series recommendations"
  spec.description   = "This gem is going to consume the API from this website https://imdb-api.com, you need at API_KEY to use."
  spec.homepage      = "https://github.com/LoginALee/what_to_watch"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
