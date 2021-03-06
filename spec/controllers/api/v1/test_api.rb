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

  describe "DELETE" do
    it 'accepts a database id number and deletes that record from the database' do

      expect(Idea.count).to eq(0)
      idea = create(:idea)
      expect(Idea.count).to eq(1)

      delete :destroy, params: {id: idea.id, format: :json}

      expect(Idea.count).to eq(0)
    end
  end

  describe "Increment quality" do
    it 'accepts a database id and increments the quality from swill to Plausible' do
      idea = create(:idea)
      expect(idea.quality).to eq("Swill")

      post :increment, params: {id: idea.id, format: :json}
      expect(Idea.last.id).to eq(idea.id)
      expect(Idea.last.quality).to eq("Plausible")
    end

    it 'accepts a database id and increments the quality from Plausible to Genius' do
      idea = create(:idea)
      expect(idea.quality).to eq("Swill")

      post :increment, params: {id: idea.id, format: :json}

      post :increment, params: {id: idea.id, format: :json}
      expect(Idea.last.id).to eq(idea.id)
      expect(Idea.last.quality).to eq("Genius")
    end

    it 'accepts a database id does not change when quality is Genius' do
      idea = create(:idea)
      expect(idea.quality).to eq("Swill")

      post :increment, params: {id: idea.id, format: :json}

      post :increment, params: {id: idea.id, format: :json}
      expect(Idea.last.id).to eq(idea.id)
      expect(Idea.last.quality).to eq("Genius")

      post :increment, params: {id: idea.id, format: :json}
      expect(Idea.last.id).to eq(idea.id)
      expect(Idea.last.quality).to eq("Genius")
    end
  end

  describe "Decrement quality" do
    it 'accepts a database id and decrements the quality from Genius to Plausible' do
      idea = create(:idea, quality: "Genius")
      expect(idea.quality).to eq("Genius")

      post :decrement, params: {id: idea.id, format: :json}
      expect(Idea.last.id).to eq(idea.id)
      expect(Idea.last.quality).to eq("Plausible")
    end

    it 'accepts a database id and decrements the quality from Genius to Swill' do
      idea = create(:idea, quality: "Genius")
      expect(idea.quality).to eq("Genius")

      post :decrement, params: {id: idea.id, format: :json}

      post :decrement, params: {id: idea.id, format: :json}
      expect(Idea.last.id).to eq(idea.id)
      expect(Idea.last.quality).to eq("Swill")
    end

    it 'accepts a database id does not change when quality is Genius' do
      idea = create(:idea, quality: "Genius")
      expect(idea.quality).to eq("Genius")

      post :decrement, params: {id: idea.id, format: :json}

      post :decrement, params: {id: idea.id, format: :json}
      expect(Idea.last.id).to eq(idea.id)
      expect(Idea.last.quality).to eq("Swill")

      post :decrement, params: {id: idea.id, format: :json}
      expect(Idea.last.id).to eq(idea.id)
      expect(Idea.last.quality).to eq("Swill")
    end
  end
end
