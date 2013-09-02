require "spec_helper"

describe "Location Management" do
  it "allows the user to create locations" do
    visit user_location_management.locations_path

    click_on "Add Wave"

    fill_in "Name", with: "Blackbear Hole"
    fill_in "Description", with: "Sweet spot brah!"

    click_on "Save"

    page.should have_content("Blackbear Hole")
  end
end