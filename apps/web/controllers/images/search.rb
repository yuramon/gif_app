# apps/web/controllers/home/index.rb

module Web
  module Controllers
    module Images
      class Search
        include Web::Action

        expose :images

        def call(params)
          #byebug
          @images = UserRepository.new.find_with_images(current_user.id).images
        end
      end
    end
  end
end
