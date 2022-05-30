# frozen_string_literal: true
module Web
  module Services
    module Http
      module Tenor
        class BaseTenor < Base

          # @api public
          # Public: Set base configs for API call.
          # @param [Hash] query_params query params
          #
          def initialize(query_params = {})
            @base_configs = YAML.load_file('config/tenor.yml').fetch('defaults')
            @query_params = query_params.merge(limit: 50)
          end
        end
      end
    end
  end
end


