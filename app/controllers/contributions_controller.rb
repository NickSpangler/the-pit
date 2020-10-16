class ContributionsController < ApplicationController

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

    def show
        set_contribution
    end

    private

    def contribution_params
        params.require(:contribution).permit(:show_id, :user_id, :title, :rich_content, :note_from_creator, :accepted, :pending_id, :kind, :image, :audio_file)
    end

    def set_contribution
        @contribution = Contribution.find_by(id: params[:id])
    end
end
