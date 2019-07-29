class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @applaused_ideas = Idea.joins(:applauses).where(applauses: {user_id: @user.id})
    @posted_ideas = Idea.where(user_id: @user.id)
    @user_reactions = IdeaReaction.where(user_id: @user.id)
    @developed_idea = Idea.where(user_id: @user.id)
  end
end
