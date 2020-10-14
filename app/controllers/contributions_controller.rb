class ContributionsController < ApplicationController

    def new
        @contribution = Contribution.new
    end

    def create

    end

    def show
        set_contribution
    end

    private

    def contribution_params
        params.require(:contribution).permit(:show_id, :user_id, :title, :content, :note_from_creator, :accepted, :pending_id)
    end

    def set_contribution
        @contribution = Contribution.find_by(id: params[:id])
    end
end
