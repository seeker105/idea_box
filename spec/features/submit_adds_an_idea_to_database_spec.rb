require 'rails_helper'

RSpec.feature "Test that submitting an Idea adds to the DB" do
  scenario 'enter title and body; click Create Idea' do
    expect(Idea.count).to eq(0)

    
  end
end
