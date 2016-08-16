require 'rails_helper'

RSpec.feature "View with Ideas" do
  scenario 'view a page with 3 ideas' do
    ideas = [create(:idea)]
    sleep 1
    ideas << create(:idea)
    sleep 1
    ideas << create(:idea)

    visit root_path

    ideas.each do |idea|
      expect(page).to have_content(idea.title)
      expect(page).to have_content(idea.body)
    end
  end
end
