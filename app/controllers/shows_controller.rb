class ShowsController < ApplicationController
    skip_before_action :verified_user, only: [:index, :show]

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

    def index
        @shows = Show.all
    end

    private

    def show_params
        params.require(:show).permit(:title, :creator_id, :logo, :rich_character_list, :rich_synopsis)
    end

    def set_show
        @show = Show.find_by(id: params[:id])
    end
end
