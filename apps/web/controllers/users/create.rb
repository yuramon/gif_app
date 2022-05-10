module Web::Controllers::Users
  class Create
    include Web::Action

    def call(_)
      user = UserRepository.new.create(email: requested_email, password: requested_password)

      if user
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to routes.new_user_path
      end
    end

    private

    def requested_email
      params[:user][:email]
    end

    def requested_password
      BCrypt::Password.create(params[:user][:password_plain])
    end

    def authenticate!; end
  end
end