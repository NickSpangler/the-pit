class ShowsController < ApplicationController
    before_action :set_show, only: [:show, :edit, :update, :destroy]
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

    def index
        @shows = Show.all
    end

    def edit
        if current_user != @show.creator
            redirect_to user_dashboard_path(current_user), notice: 'You may only edit your own shows.'
        end
    end

    def update
        if @show.creator != current_user
            redirect_to user_dashboard_path(current_user), notice: 'You may only edit your own shows.'
        else
            if @show.update(show_params)
                redirect_to user_show_path(current_user, @show)
            else
                render :edit
            end
        end
    end

    def destroy
        if @show.creator != current_user
            redirect_to user_dashboard_path(current_user), notice: 'You may only delete your own shows.'
        else
            @show.destroy
            redirect_to user_dashboard_path(current_user)
        end
    end

    def most_active
        @show = Show.most_active.first
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
