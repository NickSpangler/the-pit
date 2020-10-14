class SessionsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def new
      @user = User.new
    end
  
    def create
      if auth_hash = request.env["omniauth.auth"]
        oauth_email = request.env["omniauth.auth"]["info"]["email"]
        if @user = User.find_by(email: oauth_email)
          session[:user_id] = @user.id
          redirect_to user_dashboard_path(@user)
        else
          @user = User.new(email: oauth_email, name: request.env["omniauth.auth"]["info"]["name"], password: SecureRandom.hex)
          if @user.save
            session[:user_id] = @user.id
            redirect_to user_dashboard_path(@user)
          else
            raise @user.errors.full_messages.inspect
          end
        end
      else
        @user = User.find_by(name: params[:user][:name])
        @user = @user.try(:authenticate, params[:user][:password])
        return redirect_to(controller: 'sessions', action: 'new') unless @user
        session[:user_id] = @user.id
        redirect_to user_dashboard_path(@user)
      end
    end
  
    def destroy
      session.delete :user_id
      redirect_to '/'
    end
end
