class ShowsController < ApplicationController
    def new
        @show = current_user.created_shows.build
    end

    def create
        raise params.inspect
    end

    private

    def show_params
        params.require(:show).permit(:title, :synopsis, :character_list, :creator_id)
    end
end
