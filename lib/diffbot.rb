require 'hashie'
require 'rash'
require 'faraday'
require 'faraday_middleware'

directory = File.expand_path(File.dirname(__FILE__))
Dir[directory + '/diffbot/*.rb'].each{ |f| require f }

module Diffbot
  
end