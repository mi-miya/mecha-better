class IdeasController < ApplicationController
  before_action :authenticate

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.state = "未実現"
    @idea.user = current_user
    if @idea.save
      redirect_to @idea
    else
      render ideas_path
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @idea_reactions = @idea.idea_reactions
    @idea_reaction = IdeaReaction.new
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body, :user_id, :state, :tag)
  end
end
