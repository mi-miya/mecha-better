class IdeaDevelopersController < ApplicationController
    before_action :authenticate
  
    def create
        @idea_developer = IdeaDeveloper.new(idea_developer_params)
        if @idea_developer.save
            redirect_to @idea_developer.idea
            p "成功"
        else
            redirect_to @idea
            p "失敗"
        end
    end

    def update
        p params
        @idea_devveloper = IdeaDeveloper.find_by(idea_id: params[:idea_id], user_id: params[:user_id])
        # @idea_devveloper.update()
    end

    def destroy
        @idea_devveloper = IdeaDeveloper.find(params[:id])
        @idea_devveloper.destroy
        redirect_to idea_tasks_path(@idea_devveloper.idea)
    end

    private

    def idea_developer_params
        params.require(:idea_developer).permit(:idea_id, :user_id)
    end
end