require 'bundler'
Bundler.require

module TwilioServer
  class Base
    class << self
      attr_reader :params
      attr_reader :request

      def status
        @status ||= 200
      end
      attr_writer :status

      def call(env)
        @request = Rack::Request.new(env)
        @params = parse_query_string(env['QUERY_STRING'])
        @params.merge! request.POST if request.post?
        [
          status,
          { 'Content-Type' => 'text/html' },
          [encode_response(respond)]
        ]
      end

      def parse_query_string(query_string)
        return {} if query_string.nil? || query_string.empty?
        Rack::Utils.parse_query(query_string)
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
