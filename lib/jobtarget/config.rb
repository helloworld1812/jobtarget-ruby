require 'logger'
require 'jobtarget/connection'
require 'jobtarget/exceptions'

module Jobtarget
  class Config
    DEFAULT_LOGGER = Logger.new(nil)
    DEFAULT_BASE_URL = "https://stagingatsapi.jobtarget.com".freeze
    DEFAULT_TIMEOUT = 30.freeze

    class << self
      attr_accessor :p_token, :base_url, :logger, :read_timeout, :open_timeout

      def configure(p_token, base_url = nil)
        @p_token = p_token
        @base_url = base_url || DEFAULT_BASE_URL
        @logger = DEFAULT_LOGGER
        @read_timeout = DEFAULT_TIMEOUT
        @read_timeout = DEFAULT_TIMEOUT
        self
      end

      def reset!
        @base_url = DEFAULT_BASE_URL
        @p_token = nil
        @logger = DEFAULT_LOGGER
        @read_timeout = DEFAULT_TIMEOUT
        @read_timeout = DEFAULT_TIMEOUT
      end

      def ensure!(*params)
        params.each do |p|
          raise Jobtarget::ConfigurationError.new("'#{p}' not configured") unless instance_variable_get "@#{p}"
        end
      end

    end

    reset!
  end
end
