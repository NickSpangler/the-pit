class SessionsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def new
        @user = User.new
    end
  
    def create
      if auth_hash = request.env["omniauth.auth"]
        raise auth_hash.inspect
      else
        user = User.find_by(name: params[:user][:name])
        user = user.try(:authenticate, params[:user][:password])
        return redirect_to(controller: 'sessions', action: 'new') unless user
        session[:user_id] = user.id
        @user = user
        redirect_to user_dashboard_path(@user)
      end
    end
  
    def destroy
      session.delete :user_id
       redirect_to '/'
    end
end
