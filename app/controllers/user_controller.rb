class UserController < ApplicationController
    before_action :find_user, :only => [:show, :destroy]
    before_action :init_user_form, :only => [:create, :edit, :update, :destroy]
    protect_from_forgery except: :index
    respond_to :html, :json, :js

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

    def edit; end

    def create
      success = -> user { overide_user_form(user); respond_with(@user_form.user) }
      fail = -> user { overide_user_form(user); respond_with(@user_form.user, alert: user.errors.full_messages.join(', '))}
      @user_form.update(user_params, success: success, fail: fail)
    end

    def update
      success = -> user { overide_user_form(user); respond_with(@user_form.user) }
      fail = -> user { overide_user_form(user); respond_with(@user_form.user, alert: user.errors.full_messages.join(', '))}
      @user_form.update(user_params, success: success, fail: fail)
    end

    def destroy
      success = -> user { overide_user_form(user); respond_with(@user, notice: 'User destroyed') }
      fail = -> user { overide_user_form(user); respond_with(@user, alert: 'User cant destroyed') }
      ::UseCase::User::Delete.call(@user, success: success, fail: fail)
    end

    private
    def find_user
      user = ::UseCase::User::Find.call(params[:id])
      @user = UserDecorator.new(user)
    end

    def init_user_form
      @user_form = UserForm.new(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:name)
    end

    def overide_user_form(user)
      @user_form.user = user
    end
end
