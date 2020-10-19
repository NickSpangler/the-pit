class ShowsController < ApplicationController
    skip_before_action :verified_user, only: [:index, :show, :most_active]

    def new
        @show = Show.new
    end

    def create
        @show = current_user.created_shows.build(show_params)
        if @show.save
            redirect_to user_show_path(current_user, @show)
        else
            render :new
        end
    end

    def show
        set_show
    end

    def index
        @shows = Show.all
    end

    def edit
        set_show
    end

    def update
        set_show
         if @show.update(show_params)
            redirect_to user_show_path(current_user, @show)
        else
            render :edit
        end
    end

    def destroy
        set_show
        @show.destroy
        redirect_to user_dashboard_path(current_user)
    end

    def most_active
        @show = Show.most_active
        render 'show'
    end

    private

    def show_params
        params.require(:show).permit(:title, :creator_id, :logo, :rich_character_list, :rich_synopsis)
    end

    def set_show
        @show = Show.find_by(id: params[:id])
    end
end
