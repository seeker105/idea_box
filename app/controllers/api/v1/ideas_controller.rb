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

  def increment
    idea = Idea.find(params[:id])
    idea.increment
  end

  def decrement
    idea = Idea.find(params[:id])
    idea.decrement
  end

  def update
    idea = Idea.find(params[:id])
    idea.update_attribute(update_params[:attribute], update_params[:value])
  end

  private
  def idea_params
    params.require(:idea).permit(:title, :body)
  end

  def update_params
    params.require(:idea).permit(:attribute, :value)
  end


end
