module Web
  module Services
    module Http
      module Tenor
        class Search < BaseTenor
          def call
            response = get('search')

            unless response.success?
              return log_error("Something goes wrong. Status: #{response.status}")
            end

            JSON.parse(response.body).dig('results').map do |imag|
              {
                id: imag.dig('id'),
                url: imag.dig('media', 0, 'gif', 'url')
              }
            end
          end
        end
      end
    end
  end
end
