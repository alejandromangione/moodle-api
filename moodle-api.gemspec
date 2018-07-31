# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "moodle-api"
  spec.version       = "1.3.0"
  spec.authors       = ["Alejandro Mangione"]
  spec.email         = ["me@mangione.cc"]
  spec.summary       = %q{Ruby client for Moodle API.}
  spec.description   = %q{Ruby client for Moodle API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('rest-client', '>= 1.8.0')

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency "rake"
end