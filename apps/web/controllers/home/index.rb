# apps/web/controllers/home/index.rb

module Web
  module Controllers
    module Home
      class Index
        include Web::Action

        expose :images

        def call(params)
          @images = Services::Http::Giphy::GetTrending.new(params.to_h).call
        end
      end
    end
  end
end