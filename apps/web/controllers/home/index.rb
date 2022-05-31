# frozen_string_literal: true

# apps/web/controllers/home/index.rb

module Web
  module Controllers
    module Home
      class Index
        include Web::Action

        expose :images_giphy, :images_tenor, :images_count
        before :setup_mutex

        def call(params)
          @images_count = 0

          giphy_threat = thread_for(Services::Http::Giphy::GetTrending.new(params.to_h).call)
          tenor_threat = thread_for(Services::Http::Tenor::GetTrending.new(params.to_h).call)

          [giphy_threat, tenor_threat].each(&:join)

          @images_giphy = giphy_threat.value
          @images_tenor = tenor_threat.value
        end

        private

        def setup_mutex
          @mutex = Mutex.new
          @mutex.synchronize { @images_count }
        end

        def thread_for(service)
          Thread.new do
            service.each { |_images| @images_count += 1 }
          end
        end
      end
    end
  end
end
