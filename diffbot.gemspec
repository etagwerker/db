require File.expand_path("../lib/diffbot/version", __FILE__)

Gem::Specification.new do |s|
  s.name = %q{diffbot}
  s.version = Diffbot::VERSION
  s.platform    = Gem::Platform::RUBY
  s.required_rubygems_version = ">= 2.1.11"
  s.authors = ["Ernesto Tagwerker"]
  s.date = %q{2014-01-01}
  s.description = %q{Wrapper for the Diffbot API}
  s.email = %q{etagwerker@gmail.com}
  s.files = Dir.glob("{lib}/**/*")
  s.require_paths = ["lib"]
  s.rubygems_version = %q{2.1.11}
  s.summary = %q{Ruby wrapper for the Diffbot API}
  s.test_files = [
    "test/helper.rb",
     "test/test_diffbot.rb"
  ]

  s.add_dependency 'hashie', '~> 2.0.5'
  s.add_dependency 'faraday', '~> 0.8.8'
  s.add_dependency 'faraday_middleware', '~> 0.9.0'
  s.add_dependency 'rash', '~> 0.4.0'

  s.add_development_dependency 'fakeweb', '~> 1.3.0'
  s.add_development_dependency 'pry'
end
