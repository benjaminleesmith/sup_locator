require "feature_spec_helper"

describe "Home page" do
  it "lists locations" do
    create_location(name: "glennwood wave")

    visit "/"

    page.should have_content("glennwood wave")
  end
end