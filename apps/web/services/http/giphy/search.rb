# frozen_string_literal: true
module Web
  module Services
    module Http
      module Giphy
        class GetById < Base

          def initialize(id)
            @id = id
          end

          def call
            response = get("v1/gifs/#{@id}")

            return response if response.success?

            log_error("Something goes wrong. Gif id: #{@id}, status: #{response.status}")
          end
        end
      end
    end
  end
end

