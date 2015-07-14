require 'test_helper'

class ExampleServerTest < Test
  class ExampleServer < TwilioServer::Base
    def self.respond
      'test response'
    end
  end

  def server
    @server ||= ExampleServer
  end

  def test_response
    response = server.call({})
    assert_equal 200, response.first
    assert_match 'test response', response.last.join
  end
end
