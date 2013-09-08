require "spec_helper"

describe "Location Management" do
  it "allows the user to create locations" do
    user = create_user
    #session[:user_id] = user.id
    page.set_rack_session(:user_id => user.id)

    visit user_location_management.locations_path

    click_on "New Standing Wave"

    fill_in "Name", with: "Blackbear Hole"
    fill_in "Description", with: "Sweet spot brah!"
    select "Colorado", from: "State"

    click_on "Save"

    page.should have_content("Blackbear Hole")
    page.should have_content("CO")
  end
end