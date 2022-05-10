# apps/web/controllers/home/index.rb
module Web
  module Controllers
    module Images
      class Search
        include Web::Action

        expose :images

        def call(params)

          @images = Services::Http::Giphy::Search.new(params[:search].to_h).call
        end
      end
    end
  end
end
