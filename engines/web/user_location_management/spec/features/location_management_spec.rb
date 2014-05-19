require "spec_helper"

describe "Location Management" do
  it "allows users to create locations" do
    user = create_user
    page.set_rack_session(:user_id => user.id)

    visit user_location_management.locations_path

    click_on "New Standing Wave"

    fill_in "Name", with: "Blackbear Hole"
    fill_in "Description", with: "Sweet spot brah!"
    select "Colorado", from: "State"

    # fill_in "Youtube URL", with: "http://www.youtube.com/watch?v=vwJY50YtZHU"
    # click_on "Add More"

    click_on "Save"

    page.should have_content("Blackbear Hole")
    page.should have_content("CO")
  end

  it "allows users to edit locations" do
    user = create_user
    create_standing_wave name: "Old Wave", user_id: user.id
    page.set_rack_session(:user_id => user.id)

    visit user_location_management.locations_path

    page.should have_content("Old Wave")

    click_on "Edit"

    fill_in "Name", with: "New Wave"

    click_on "Save"

    page.should have_content("New Wave")
  end
end