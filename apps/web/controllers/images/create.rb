# frozen_string_literal: true

module Web::Controllers::Images
  class Create
    include Web::Action

    def call(_)
      ImageRepository.new.create(giphy_id: params[:image][:id],
                                      url: params[:image][:url],
                                      user_id: current_user.id)
      redirect_to '/'
    end
  end
end
