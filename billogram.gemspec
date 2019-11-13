# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'billogram/version'

Gem::Specification.new do |spec|
  spec.name          = "billogram"
  spec.version       = Billogram::VERSION
  spec.authors       = ["mbirman"]
  spec.description   = %q{Simple ruby wrapper for Billogram API}

  spec.summary       = "Ruby library providing access to Billogram API"
  spec.homepage      = "http://github.com/mbirman/billogram"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.4'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.9"
  spec.add_development_dependency "webmock", "~> 3.7"
  spec.add_development_dependency "dotenv", "~> 2.7"
  spec.add_development_dependency "byebug"

  spec.add_dependency "httparty", "~> 0.17.1"
  spec.add_dependency "activesupport", "~> 5.2"
end
