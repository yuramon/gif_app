# apps/web/controllers/home/index.rb

module Web
  module Controllers
    module Images
      class Index
        include Web::Action

        expose :images

        def call(_)
          @images = UserRepository.new.find_with_images(current_user.id).images
        end
      end
    end
  end
end