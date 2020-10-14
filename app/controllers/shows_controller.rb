class ShowsController < ApplicationController
    def new
        @show = Show.new
    end

    def create
        @show = current_user.created_shows.create(show_params)
        redirect_to user_show_path(current_user, @show)
    end

    def show
        set_show
    end

    private

    def show_params
        params.require(:show).permit(:title, :synopsis, :character_list, :creator_id)
    end

    def set_show
        @show = Show.find_by(id: params[:id])
    end
end
