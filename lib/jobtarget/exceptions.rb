module Jobtarget
  class RequestError < StandardError
    attr_accessor :response

    def initialize(response, message=nil)
      message += "\n" if message
      error = super("#{message}Response body: #{response.body}",)
      error.response = response
      error
    end
  end

  class ConfigurationError < StandardError; end
  class MissingInterpolation < StandardError; end
  class ContactExistsError < RequestError; end
  class InvalidParams < StandardError; end
  class ApiError < StandardError; end
end
