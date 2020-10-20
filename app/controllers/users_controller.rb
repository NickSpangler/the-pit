class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create, :index, :show]
    
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_dashboard_path(@user)
        else
            render :new
        end
    end

    def dashboard
        @user = User.find_by(id: session[:user_id])
    end

    def index
        @users = User.all
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
