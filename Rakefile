$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'rake/testtask'
task default: :test
Rake::TestTask.new(:test) do |t|
  t.verbose = true if ARGV.include? '-v'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
end

task :build do
  system "gem build twilio_server.gemspec"
end

task :install do
  require 'twilio_server/version'
  system "gem uninstall twilio_server"
  system "gem install twilio_server-#{TwilioServer::VERSION}.gem"
end
