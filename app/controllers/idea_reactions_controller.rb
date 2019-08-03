class IdeaReactionsController < ApplicationController
    before_action :authenticate
  
    def create
        @idea_reaction = IdeaReaction.new(idea_reaction_params)
        if @idea_reaction.save
            redirect_to @idea_reaction.idea
            p "成功"
        else
            redirect_to @idea
            p "失敗"
        end
    end

    private

    def idea_reaction_params
        params.require(:idea_reaction).permit(:idea_id, :user_id, :comment)
    end
end
