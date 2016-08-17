class Api::V1::IdeasController < ApplicationController

  def index
    @ideas = Idea.order(created_at: :desc)
  end

  def create
    @idea = Idea.create(idea_params)
  end

  def destroy
    @result = Idea.delete(params[:id])
  end

  private
  def idea_params
    params.require(:idea).permit(:title, :body)
  end
end
