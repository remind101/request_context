# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'request_context/version'

Gem::Specification.new do |spec|
  spec.name          = 'request_context'
  spec.version       = RequestContext::VERSION
  spec.authors       = ['David Kopf']
  spec.email         = ['david@remind101.com']
  spec.description   = %q{Classes for tracking request context}
  spec.summary       = %q{Classes for tracking request context}
  spec.homepage      = 'https://github.com/remind101/request_context'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rack-test'
end
