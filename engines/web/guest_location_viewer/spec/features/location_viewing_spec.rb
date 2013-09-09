require "spec_helper"

describe "Location Viewing" do
  it "lists locations" do
    create_standing_wave name: "Glenwood Springs", state_abbreviation: "CO"

    visit guest_location_viewer.locations_path

    page.should have_content("Colorado")
    page.should have_content("Glenwood Springs")
  end
end