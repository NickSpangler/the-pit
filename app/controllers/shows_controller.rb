class ShowsController < ApplicationController
    def new
        @show = current_user.created_shows.build
    end

    def create
        
    end
end
