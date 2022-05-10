# frozen_string_literal: true
module Web
  module Services
    module Http
      class Base
        GIPHY_CONFIG = YAML.load_file('config/giphy.yml').fetch('defaults')

        # @api public
        # Public: Makes a GET request using the Faraday HTTP Client.
        #
        # @param [String] path specific API action
        # @param [Hash] query_params query params
        #
        # @return [Faraday::Response] instance of Faraday::Response class
        def get(path, query_params = {})
          query_params[:api_key] = GIPHY_CONFIG.fetch('api_key')

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
          Faraday.new(url: GIPHY_CONFIG.fetch('url'), headers: headers)
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


