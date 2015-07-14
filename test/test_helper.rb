ENV['RACK_ENV'] = 'test'

require 'dotenv'
Dotenv.load

require 'bundler'
Bundler.require(:default, :test)

require 'codeclimate-test-reporter'
SimpleCov.start do
  formatter SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    CodeClimate::TestReporter::Formatter
  ]
end
require 'twilio_server'

require 'minitest/autorun'
require 'rack/test'

class Test < Minitest::Test
end
