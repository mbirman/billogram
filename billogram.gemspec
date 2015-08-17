# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'billogram/version'

Gem::Specification.new do |spec|
  spec.name          = "billogram"
  spec.version       = Billogram::VERSION
  spec.authors       = ["Mark Birman"]
  spec.email         = ["birmanmark@gmail.com"]

  spec.summary       = %q{Simple ruby wrapper over Billogram API}
  spec.homepage      = "http://github.com/mbirman/billogram"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "httparty", "~> 0.13"
end
