require 'rails_helper'

RSpec.feature "Test that submitting an Idea adds to the DB" do
  scenario 'enter title and body; click Create Idea', js: true do
    expect(Idea.count).to eq(0)

    visit root_path

    fill_in "Title", with: "Test_title"
    fill_in "Body", with: "Test_body"
    click_button "Create Idea"

    expect(Idea.count).to eq(1)
    expect(Idea.last.title).to eq(test_title)
    expect(Idea.last.body).to eq(test_body)
    expect(Idea.last.quality).to eq("Swill")
  end
end
