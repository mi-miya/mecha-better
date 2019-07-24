class StaticPagesController < ApplicationController
  def top
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
