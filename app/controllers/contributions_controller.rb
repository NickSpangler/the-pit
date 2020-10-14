class ContributionsController < ApplicationController

    def new
        @contribution = Contribution.new
        @show = Show.find_by(id: params[:show_id])
    end

    def create
        @contribution = Contribution.new(contribution_params)
        @contribution.save
        redirect_to show_contribution_path(@contribution.show_id, @contribution)
    end

    def show
        set_contribution
    end

    private

    def contribution_params
        params.require(:contribution).permit(:show_id, :user_id, :title, :content, :note_from_creator, :accepted, :pending_id, :kind, :image)
    end

    def set_contribution
        @contribution = Contribution.find_by(id: params[:id])
    end
end
