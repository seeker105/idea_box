class IdeasController < ApplicationController
  def index
    @ideas = Idea.order(:created_at)
  end
end
