class UserRepository
  attr_reader :datasource
  def initialize(datasource: User)
    @datasource = datasource
  end

  def all
    datasource.all
  end

  def find(args)
    datasource.find(args)
  end

  def new_entity(args = nil)
    datasource.new(args)
  end

  def find_or_initialize_by(args = {id: nil})
    datasource.find_or_initialize_by(**args)
  end

  def save(user)
    user.save
  end

  def delete(user)
    user.destroy
  end
end
