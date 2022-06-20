# apps/web/controllers/home/index.rb
module Web
  module Controllers
    module Images
      class Search
        include Web::Action

        expose :images

        def call(params)
          @images = Services::Http::SearchFactory.call(params[:search].to_h)
        end
      end
    end
  end
end
