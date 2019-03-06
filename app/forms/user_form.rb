class UserForm
  attr_reader :user
  def initialize(args)
    @user = !!args ? ::UseCase::User::Find.call(args.id) : ::UseCase::User::New.call()
  end
end
