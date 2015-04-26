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

  spec.add_dependency "dropbox-sdk",         "~> 1.6.0"
  spec.add_dependency "metadown",            "1.1.0.beta"
  spec.add_dependency "pygments.rb",         "~> 0.6.0"
  spec.add_dependency "nokogiri",            "~> 1.6.6.0"
  spec.add_dependency "kaminari",            "~> 0.16.0"
  spec.add_dependency "groupdate",           "~> 2.4.0"
  spec.add_dependency "slim",                "~> 3.0.0"
  spec.add_dependency "builder",             "~> 3.2.0"
  spec.add_dependency "acts-as-taggable-on", "~> 3.5.0"
  spec.add_dependency "friendly_id",         "~> 5.1.0"
  spec.add_dependency "rails",               "~> 4.2.0"

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
