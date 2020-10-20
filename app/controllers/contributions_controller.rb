class ContributionsController < ApplicationController
    before_action :set_contribution, only: [:show, :edit, :update, :destroy]
    skip_before_action :verified_user, only: [:show]

    def select
        @show = Show.find_by(id: params[:id])
    end

    def new
        @kind = params[:kind]
        @contribution = Contribution.new
        @show = Show.find_by(id: params[:show_id])
    end

    def create
        @contribution = Contribution.new(contribution_params)
        if @contribution.valid?
            @contribution.save
            redirect_to show_contribution_path(@contribution.show_id, @contribution)
        else
            @show = Show.find_by(id: params[:show_id])
            render :new
        end
    end

    def edit
        if current_user == @contribution.contributor
            @show = @contribution.show
        else
            redirect_to user_dashboard_path(current_user), notice: 'You may only edit your own contributions.'
        end
    end

    def update
        if @contribution.contributor != current_user
            redirect_to user_dashboard_path(current_user), notice: 'You may only edit your own contributions.'
        else
            if @contribution.update(contribution_params)
                redirect_to show_contribution_path(@contribution.show_id, @contribution)
            else
                @show = @contribution.show
                render "edit"
            end
        end
    end

    def destroy
        if @contribution.contributor != current_user
            redirect_to user_dashboard_path(current_user), notice: 'You may only delete your own contributions.'
        else
            @contribution.destroy
            redirect_to user_dashboard_path(current_user)
        end
    end

    private

    def contribution_params
        params.require(:contribution).permit(:show_id, :user_id, :title, :rich_content, :kind, :image, :audio_file)
    end

    def set_contribution
        @contribution = Contribution.find_by(id: params[:id])
    end
end
