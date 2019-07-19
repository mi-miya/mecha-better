class IdeasController < ApplicationController
  before_action :authenticate, only: [:create, :new]

  def index
    ideas = []
    params[:state].blank? ? (@state = "") : (@state = params_to_state(params[:state]))
    # searchとstateが指定されている場合
    if !params[:search].blank? && !@state.empty?
      search_split = params[:search].split(/[[:blank:]]+/)
      search_split.each do |keyword|
        next if keyword.blank?
        ideas += Idea.where(state: @state).where('tag LIKE ? OR title LIKE ?', "%#{keyword}%", "%#{keyword}%")
      end
      ideas.sort!{|a,b|
        b[:created_at] <=> a[:created_at]
      }
      @ideas = Kaminari.paginate_array(ideas).page(params[:page])
    # searchのみ指定されている場合
    elsif !params[:search].blank?
      search_split = params[:search].split(/[[:blank:]]+/)
      search_split.each do |keyword|
        next if keyword.blank?
        ideas += Idea.where('tag LIKE ? OR title LIKE ?', "%#{keyword}%", "%#{keyword}%")
      end
      ideas.sort!{|a,b|
        b[:created_at] <=> a[:created_at]
      }
      @ideas = Kaminari.paginate_array(ideas).page(params[:page])
    # stateのみ指定されている場合
    elsif !@state.blank?
      @ideas = Idea.where(state: @state).order(created_at: "DESC").page(params[:page])
    else
      @ideas = Idea.order(created_at: "DESC").page(params[:page])
    end
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

  def params_to_state(word)
    case word
    when "mijitugen" then
      return "未実現"
    when "jitugenzumi" then
      return "実現済み"
    when "taioutyuu" then
      return "対応中"
    when "sudeniaru" then
      return "既にある"
    end
  end
end
