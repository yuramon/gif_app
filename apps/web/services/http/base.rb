# frozen_string_literal: true
module Web
  module Services
    module Http
      class Base
        attr_reader :base_configs, :query_params

        # @api public
        # Public: Set base configs for API call. By default configs set for giphy API.
        # @param [Hash] query_params query params
        #
        def initialize(query_params = {})
          @base_configs = YAML.load_file('config/giphy.yml').fetch('defaults')
          @query_params = query_params
        end

        # @api public
        # Public: Makes a GET request using the Faraday HTTP Client.
        #
        # @param [String] path specific API action
        #
        # @return [Faraday::Response] instance of Faraday::Response class
        def get(path)
          param = base_configs.fetch('api_param_name')&.to_sym
          query_params[param] = base_configs.fetch('api_key')

          connection.get(path) do |req|
            req.params = query_params
          end
        end

        private

        # @api private
        # Internal: Creates a Faraday::Connection to setup a common config.
        #
        # @return [Faraday::Connection] Faraday::Connection object
        def connection
          Faraday.new(url: base_configs.fetch('url'), headers: headers)
        end

        # @api private
        # Internal: Creates a hash of the default request headers
        #
        # @return [Hash] default request headers
        def headers
          {
            'Content-Type' => 'application/json',
            'Accept' => 'application/json'
          }
        end

        # @api private
        # Internal: Logs unsuccessful service calls.
        #
        # @param [String] message the message to log
        def log_error(message)
          Hanami.logger.error message
        end
      end
    end
  end
end


