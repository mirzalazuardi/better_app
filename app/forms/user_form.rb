class UserForm
  attr_accessor :user

  def initialize(args = {id: nil})
    @user = ::UseCase::User::FindOrInitializeBy.call(**args)
    ::UseCase::User::FindOrInitializeBy.call(**args)
  end

  def update(attributes, callbacks)
    ::UseCase::User::Save.call(attributes, success: callbacks[:success], fail: callbacks[:fail])
  end
end
