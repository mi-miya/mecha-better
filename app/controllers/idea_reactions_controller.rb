class IdeaReactionsController < ApplicationController
    before_action :authenticate
  
    def create
        @idea = Idea.find(params[:idea_id])
        @idea_reaction = IdeaReaction.new(idea_reaction_params)
        @idea_reaction.idea = @idea
        @idea_reaction.user = current_user

        if @idea_reaction.save
            redirect_to @idea
        else
            render 'ideas/show'
        end
    end

    private

    def idea_reaction_params
        params.require(:idea_reaction).permit(:idea_id, :comment)
    end
end
