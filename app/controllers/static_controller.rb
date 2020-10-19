class StaticController < ApplicationController
  skip_before_action :verified_user

  def welcome
    if current_user
      redirect_to user_dashboard_path(current_user)
    end
  end

end
