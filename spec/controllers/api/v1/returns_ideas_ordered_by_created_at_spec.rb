require 'rails_helper'

RSpec.describe Api::V1::IdeasController, type: :controller do
  render_views

  describe "GET index" do
    it 'returns a list of ideas sorted by created_at' do
      # ideas = [create(:idea)]
      # sleep 1
      # ideas << create(:idea)
      # sleep 1
      # ideas << create(:idea)
      #
      # byebug
      # get :index, params: {format: :json}
      # byebug
      # result = JSON.parse(response.body)
    end
  end
end
