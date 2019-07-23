class ApplausesController < ApplicationController
    before_action :authenticate

    def create
        @idea = Idea.find(params[:idea_id])
        current_user.applaud(@idea)
        respond_to do |format|
          format.html { redirect_to @idea }
          format.js
        end
    end

    def destroy
        @idea = Idea.find(params[:idea_id])
        current_user.un_applaud(@idea)
        redirect_to ideas_path
    end
end
