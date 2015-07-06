require_relative 'lib/twilio_server/version'

Gem::Specification.new do |spec|
  spec.name = 'twilio_server'
  spec.version = TwilioServer::VERSION
  spec.date = '2015-07-04'
  spec.summary = 'Twilio Server'
  spec.description = 'A rack based server platform'
  spec.authors = ['Tim Heuett']
  spec.email = 'tim.heuett@gmail.com'
  spec.files = Dir["{bin,lib}/**/*.rb"] + Dir["*.md"]
  spec.license = 'MIT'
  spec.add_runtime_dependency 'twilio-ruby', '~> 4'
end
