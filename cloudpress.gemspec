# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloudpress/version'

Gem::Specification.new do |spec|
  spec.name          = "cloudpress"
  spec.version       = Cloudpress::VERSION
  spec.authors       = ["Adam Carlile"]
  spec.email         = ["adam@benchmedia.co.uk"]

  spec.summary       = "A blogging framework that uses dropbox as it's storage engine"
  spec.homepage      = "http://github.com/adamcarlile/cloudpress"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dropbox-sdk"
  spec.add_dependency "metadown"
  spec.add_dependency "pygments.rb"
  spec.add_dependency "nokogiri"
  spec.add_dependency "kaminari"
  spec.add_dependency "builder"
  spec.add_dependency "groupdate"
  spec.add_dependency "slim"
  spec.add_dependency "acts-as-taggable-on"
  spec.add_dependency "friendly_id"
  spec.add_dependency "rails", "~> 4.2.0"

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
