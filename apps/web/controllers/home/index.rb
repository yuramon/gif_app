# apps/web/controllers/home/index.rb

module Web
  module Controllers
    module Home
      class Index
        include Web::Action

        def call(params)
          Services::Http::Giphy::GetById.new("12vJgj7zMN3jPy").call

        end
      end
    end
  end
end