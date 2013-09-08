require 'spec_helper'

describe 'User Signup' do
  context "as a guest" do
    it 'the guest to sign up' do
      visit user_management.new_user_path

      fill_in "Email", with: "foo@example.com"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "password"

      expect {
        click_on "Sign Up!"
      }.to change { Users::User.count }.by(1)

      visit user_management.logout_path

      visit user_management.new_session_path

      fill_in "Email", with: "foo@example.com"
      fill_in "Password", with: "password"

      within "form" do
        click_on "Login"
      end

      page.should_not have_content "Login"
    end
  end
end