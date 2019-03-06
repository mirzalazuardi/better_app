class UserController < ApplicationController
    before_action :find_user, :only => [:show, :edit, :update, :destroy]
    respond_to :html, :json

    def index
      users  = ::UseCase::User::List.call()
      @users = UserDecorator.wrap_collection(users)
      respond_with @users
    end

    def show
      respond_with @user
    end

    def new
      @user_form = UserForm.new
      respond_with @user_form.user
    end

    def edit
      @user_form = UserForm.new(@user)
    end

    def create
      success = -> user { overide_user(user); respond_with(@user) }
      failure = -> user { overide_user(user); respond_with(@user, alert: user.errors.full_messages.join(', '))}
      ::UseCase::User::Save.call(user_params, success: success, fail: failure)
    end

    def update
      success = -> user { overide_user(user); respond_with(@user) }
      failure = -> user { overide_user(user); respond_with(@user, alert: user.errors.full_messages.join(', '))}
      ::UseCase::User::Update.call(@user, user_params, success: success, fail: failure)
    end

    def destroy
      success = -> { redirect_to(users_path) }
      failure = -> { redirect_to(users_path) }
      ::UseCase::User::Delete.call(@user, success: success, fail: failure)
    end

    private
    def find_user
      user = ::UseCase::User::Find.call(params[:id])
      @user = UserDecorator.new(user)
    end

    def user_params
      params.require(:user).permit(:name)
    end

    def overide_user(user)
      @user = user
    end
end
