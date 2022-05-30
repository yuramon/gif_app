# frozen_string_literal: true

module Web
  module Services
    module Http
      module Giphy
        class GetTrending < Base

          def call
            response = get('v1/gifs/trending')

            unless response.success?
              return log_error("Something goes wrong. Status: #{response.status}")
            end

            JSON.parse(response.body).dig('data').map do |imag|
              {
                id: imag.dig('id'),
                url: imag.dig('images', 'original', 'url')
              }
            end
          end
        end
      end
    end
  end
end
