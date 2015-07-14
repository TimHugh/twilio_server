require 'test_helper'

class TwilioServerBaseTest < Test
  def server
    @server ||= TwilioServer::Base
  end

  def test_default_status_is_ok
    assert_equal server.status, 200
  end

  def test_parse_empty_query_string
    assert_equal server.parse_query_string(""), {}
    assert_equal server.parse_query_string(nil), {}
  end

  def test_parse_query_string
    assert_equal server.parse_query_string('key=value'), 'key' => 'value'
  end

  def test_twiml_encoding
    expected_response = %(<?xml version="1.0" encoding="UTF-8"?><Response><Message>message</Message></Response>)
    assert_equal expected_response, server.encode_response('message')
  end

  def test_must_override_respond
    assert_raises NoMethodError do
      server.respond
    end
  end
end
