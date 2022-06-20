# frozen_string_literal: true

module Web
  module Services
    module Http
      class SearchFactory
        def self.call(params)

          service = case params[:service_type]
                    when 'tenor'
                      Web::Services::Http::Tenor::Search.new(params)
                    else
                      Web::Services::Http::Giphy::Search.new(params)
                    end

          service.call
        end
      end
    end
  end
end
