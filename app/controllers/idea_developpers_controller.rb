class IdeaDeveloppersController < ApplicationController
    before_action :authenticate
  
    def create
        @idea_developper = IdeaDevelopper.new(idea_developper_params)
        if @idea_developper.save
            redirect_to @idea_developper.idea
            p "成功"
        else
            # render 'ideas/show'
            redirect_to @idea_developper.idea
            p "失敗"
        end
    end

    private

    def idea_developper_params
        params.require(:idea_developper).permit(:user_id, :idea_id)
    end
end
