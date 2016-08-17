require 'rails_helper'

RSpec.feature "Display the basic html" do
  scenario 'view the idea entry form' do
    visit root_path

    expect(page).to have_field("Title")
    expect(page).to have_field("Body")
    expect(page).to have_button("Save")
  end
end
