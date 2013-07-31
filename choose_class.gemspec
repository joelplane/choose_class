# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'choose_class/version'

Gem::Specification.new do |spec|
  spec.name          = "choose_class"
  spec.version       = ChooseClass::VERSION
  spec.authors       = ["Joel Plane"]
  spec.email         = ["joel.plane@gmail.com"]
  spec.description   = %q{Choose a class based on the value that would be passed to that class. Useful for implementing factory method pattern.}
  spec.summary       = %q{Choose subclass based on another objects class}
  spec.homepage      = "https://github.com/joelplane/choose_class"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
