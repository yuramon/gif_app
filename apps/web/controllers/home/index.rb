# apps/web/controllers/home/index.rb

module Web
  module Controllers
    module Home
      class Index
        include Web::Action

        expose :images_giphy, :images_tenor

        def call(params)
          @images_giphy = Services::Http::Giphy::GetTrending.new(params.to_h).call
          @images_tenor = Services::Http::Tenor::GetTrending.new(params.to_h).call
        end
      end
    end
  end
end