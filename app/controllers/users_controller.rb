class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create, :index, :show]
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        return redirect_to controller: 'users', action: 'new' unless @user.save
        session[:user_id] = @user.id
        redirect_to user_dashboard_path(@user)
    end

    def dashboard
        @user = User.find_by(id: session[:user_id])
    end

    def index
        @users = User.all
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
