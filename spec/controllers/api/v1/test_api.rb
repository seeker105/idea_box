require 'rails_helper'

RSpec.describe Api::V1::IdeasController, type: :controller do
  render_views

  describe "GET index" do
    it 'returns a list of ideas sorted by created_at' do
      ideas = [create(:idea)]
      sleep 1
      ideas << create(:idea, quality: 1)
      sleep 1
      ideas << create(:idea, quality: 2)

      get :index, params: {format: :json}
      result = JSON.parse(response.body, symbolize_names: true)
      ideas.reverse.each_with_index do |idea, x|
        expect(idea.title).to eq(result[x][:title])
        expect(idea.body).to eq(result[x][:body])
        expect(idea.quality).to eq(result[x][:quality])
      end
    end
  end

  describe "POST create" do
    it "accepts a title and body and adds to the DB with a quality=swill" do
      test_title = "Test_title"
      test_body = "Test_body"

      expect(Idea.count).to eq(0)

      response = post :create, params: { idea: {title: test_title, body: test_body}, format: :json}
      result = JSON.parse(response.body, symbolize_names: true)

      expect(result[:title]).to eq(test_title)
      expect(result[:body]).to eq(test_body)
      expect(result[:quality]).to eq("Swill")

      expect(Idea.count).to eq(1)
      expect(Idea.last.title).to eq(test_title)
      expect(Idea.last.body).to eq(test_body)
      expect(Idea.last.quality).to eq("Swill")
    end
  end
end
