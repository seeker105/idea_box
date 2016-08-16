require 'rails_helper'

RSpec.describe Api::V1::IdeasController, type: :controller do
  render_views

  describe "GET index" do
    it 'returns a list of ideas sorted by created_at' do
      ideas = [create(:idea)]
      sleep 1
      ideas << create(:idea)
      sleep 1
      ideas << create(:idea)

      get :index, params: {format: :json}
      result = JSON.parse(response.body, symbolize_names: true)
      ideas.reverse.each_with_index do |idea, x|
        expect(idea.title).to eq(result[x][:title])
        expect(idea.body).to eq(result[x][:body])
      end
    end
  end
end
