# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'woodhouse/status/version'

Gem::Specification.new do |spec|
  spec.name          = "woodhouse-status"
  spec.version       = Woodhouse::Status::VERSION
  spec.authors       = ["Matthew Boeh"]
  spec.email         = ["matt@crowdcompass.com", "matthew.boeh@gmail.com"]
  spec.description   = %q{In-process HTTP status server for woodhouse.}
  spec.summary       = %q{An extension to Woodhouse that provides an HTTP status server.}
  spec.homepage      = "http://github.com/mboeh/woodhouse-status"

  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "woodhouse", ">= 0.1.4"
  spec.add_dependency "reel"
  spec.add_dependency "octarine"
  spec.add_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
