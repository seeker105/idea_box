require 'rails_helper'

RSpec.describe "when data POSTed to idea create" do
  it "adds an Idea to the DB" do
    test_title = "Test_title"
    test_body = "Test_body"

    expect(Idea.count).to eq(0)

    post "/api/v1/ideas", { idea: {title: test_title, body: test_body}, format: :json}

    expect(Idea.count).to eq(1)
    expect(Idea.last.title).to eq(test_title)
    expect(Idea.last.body).to eq(test_body)
    expect(Idea.last.quality).to eq("Swill")

  end
end
