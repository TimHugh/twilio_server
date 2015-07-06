require 'bundler'
Bundler.require

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'twilio_server/version'

task :build do
  system "gem build twilio_server.gemspec"
end

task :install do
  system "gem uninstall twilio_server"
  system "gem install twilio_server-#{TwilioServer::VERSION}.gem"
end
