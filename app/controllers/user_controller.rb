class UserController < ApplicationController
    before_action :find_user, :only => [:show, :edit, :update, :destroy]

    def index
      @users = ::UseCase::User::List.call()
    end

    def show; end

    def new
      @user = ::UseCase::User::New.call()
    end

    def edit; end

    def create
      success = -> user { @user = user ; flash[:notice] = 'User was successfully created.';  redirect_to (@user) }
      failure = -> { render :action => "new" }
      ::UseCase::User::Save.call(user_params, success: success, fail: failure)
    end

    def update
      success = -> user {@user = user ; flash[:notice] = 'User was successfully updated.'; redirect_to(@user)}
      failure = -> { render :action => "edit" }
      ::UseCase::User::Update.call(@user, user_params, success: success, fail: failure)
    end

    def destroy
      success = -> { redirect_to(users_path) }
      failure = -> { redirect_to(users_path) }
      ::UseCase::User::Delete.call(@user, success: success, fail: failure)
    end

    private
    def find_user
      @user = ::UseCase::User::Find.call(params[:id])
    end

    def user_params
      params.permit(:name)
    end
end
