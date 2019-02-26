class UserRepository
  def all
    User.all
  end

  def find(args)
    User.find(args)
  end

  def new_entity(args = nil)
    User.new(args)
  end

  def save(user)
    user.save
  end

  def delete(user)
    user.destroy
  end
end
