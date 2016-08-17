class Api::V1::IdeasController < ApplicationController

  def index
    @ideas = Idea.order(created_at: :desc)
  end

  def create
    Idea.create(idea_params)
    redirect_to root_path
  end

  private
  def idea_params
    params.require(:idea).permit(:title, :body)
  end
end
