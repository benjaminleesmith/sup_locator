require "spec_helper"

describe "Location Management" do
  let(:user) { create_user }

  before do
    page.set_rack_session(:user_id => user.id)
  end

  it "allows users to create locations" do
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
    create_standing_wave name: "Old Wave", user_id: user.id

    visit user_location_management.locations_path

    page.should have_content("Old Wave")

    click_on "Edit"

    fill_in "Name", with: "New Wave"

    click_on "Save"

    page.should have_content("New Wave")
  end

  it "allows users to delete locations" do
    location = create_standing_wave name: "Wave to be deleted", user_id: user.id

    visit user_location_management.locations_path

    page.should have_content("Wave to be deleted")

    click_on "Delete"

    page.should have_content("Are you sure you want to delete 'Wave to be deleted'?")

    select "Duplicate or Bad information", from: "Reason for Deletion"

    click_on "Confirm Delete"

    page.should_not have_content("Wave to be deleted")

    location.reload.deletion_reason.should == "BD"
  end
end