require "feature_spec_helper"

describe "Require Authenication" do
  it "redirects the user when they are not authenicated" do
    create_user(email: "test@example.com", password: "password")

    visit user_location_management.locations_path

    current_path.should == "/"

    page.should have_content("Please login to access that page.")

    click_on "Login"

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    visit user_location_management.locations_path

    page.should have_content("New Standing Wave")
  end
end