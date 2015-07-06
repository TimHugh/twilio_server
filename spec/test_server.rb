require 'twilio_server'

class TestServer < TwilioServer::Base
  def self.respond
    params.inspect
  end
end
