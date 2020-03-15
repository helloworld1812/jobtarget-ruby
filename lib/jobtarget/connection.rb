module Jobtarget
  class Connection
    include HTTParty

    class << self
      def get_json(path, opts = {})
        url = generate_url(path)
        params = generate_params(opts)
        options = {
          query: params,
          format: :json,
          read_timeout: read_timeout(opts),
          open_timeout: open_timeout(opts)
        }

        response = get(url, options)
        log_request_and_response url, response
        handle_response(response)
      end

      def post_json(path, opts)
        no_parse = opts[:params]&.delete(:no_parse) { false }

        url = generate_url(path)
        params = generate_params(opts)

        options = {
          body: params.to_json,
          headers: { 'Content-Type' => 'application/json' },
          format: :json,
          read_timeout: read_timeout(opts),
          open_timeout: open_timeout(opts)
        }
        response = post(url, options)

        log_request_and_response url, response, opts[:params]
        raise(Jobtarget::RequestError.new(response)) unless response.success?

        no_parse ? response : response.parsed_response
      end

      def put_json(path, opts)
        no_parse = opts[:params]&.delete(:no_parse) { false }
        url = generate_url(path)
        params = generate_params(opts)

        options = {
          body: params.to_json,
          headers: { "Content-Type" => "application/json" },
          format: :json,
          read_timeout: read_timeout(opts),
          open_timeout: open_timeout(opts),
        }

        response = put(url, options)

        log_request_and_response(url, response, options[:body])
        raise(Jobtarget::RequestError.new(response)) unless response.success?

        no_parse ? response : response.parsed_response
      end

      def delete_json(path, opts)
        url = generate_url(path)

        options = {
          format: :json,
          read_timeout: read_timeout(opts),
          open_timeout: open_timeout(opts)
        }
        response = delete(url, options)

        log_request_and_response url, response, opts[:params]
        raise(Jobtarget::RequestError.new(response)) unless response.success?
        response
      end

      protected

      def read_timeout(opts = {})
        opts.delete(:read_timeout) || Jobtarget::Config.read_timeout
      end

      def open_timeout(opts = {})
        opts.delete(:open_timeout) || Jobtarget::Config.open_timeout
      end

      def handle_response(response)
        if response.success?
          response.parsed_response
        else
          raise Jobtarget::RequestError.new(response)
        end
      end

      def log_request_and_response(uri, response, body=nil)
        Jobtarget::Config.logger.info(<<~MSG)
          Jobtarget: #{uri}.
          Body: #{body}.
          Response: #{response.code} #{response.body}
        MSG
      end

      def generate_url(url)
        base_url = Jobtarget::Config.base_url
        base_url + url
      end

      def generate_params(opts = {})
        params = opts[:params] || {}
        params = params_with_p_token(params) if opts[:p_token]
        params = params_with_token(params) if opts[:token]
        params
      end

      def params_with_p_token(params)
        if Jobtarget::Config.p_token
          params[:p_token] = Jobtarget::Config.p_token
        else
          Jobtarget::Config.ensure! :p_token
        end

        params
      end

      def params_with_token(params)
        if params['token'].nil? && params[:token].nil?
          raise Jobtarget::ConfigurationError.new("token not passed")
        end

        params
      end

    end
  end

end
