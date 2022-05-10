class UserRepository < Hanami::Repository
  associations do
    has_many :images
  end

  def find_by_email(email)
    users
      .where(email: email)
      .as(User)
      .one
  end

  def find_with_images(id)
    aggregate(:images).where(id: id).as(User).one
  end
end
