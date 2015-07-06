require 'bundler'
Bundler.require
require 'cgi'

module TwilioServer
  class Base
    class << self
      attr_reader :params

      def status
        @status ||= 200
      end
      attr_writer :status

      def call(env)
        @params = env['QUERY_STRING'].nil? ? {} : CGI.parse(env['QUERY_STRING'])
        [
          status,
          { 'Content-Type' => 'text/html' },
          [encode_response(respond)]
        ]
      end

      def encode_response(message)
        twiml = Twilio::TwiML::Response.new { |r| r.Message message }
        twiml.text
      end

      def respond
        fail NoMethodError, "#{self}\:Class must implement \#respond method"
      end
    end
  end
end
