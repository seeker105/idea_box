require 'rails_helper'

RSpec.feature "Display the basic html" do
  scenario 'view the idea entry form' do
    visit root_path

    expect(page).to have_field("Title")
    expect(page).to have_field("Body")
    save_and_open_page
    expect(page).to have_button("Create Idea")
  end
end
