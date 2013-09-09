require "feature_spec_helper"

describe "Profile page" do
  it "it lists the user's locations" do
    user = create_user(email: "test@example.com", password: "password")
    create_standing_wave(user_id: user.id, name: "my standing wave")

    visit "/"

    click_on "Login"

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    within "form" do
      click_on "Login"
    end

    click_on "Profile"

    page.should have_content("my standing wave")

    click_on "Home"

    page.should have_content("my standing wave")
  end
end