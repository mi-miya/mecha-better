class StaticPagesController < ApplicationController
  def top
    @ideas = Idea.includes(:applauses).order("applauses.count").limit(3)
  end

  def signin
  end

  def privacy
  end

  def sitemap
    @domain = "#{request.protocol}#{request.host}"
    @ideas = Idea.all
  end
end
