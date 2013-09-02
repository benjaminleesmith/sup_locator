require 'spec_helper'

describe 'User Signup' do
  context "as a guest" do
    it 'the guest to sign up' do
      visit '/'

      click_on "Sign Up"

      fill_in "Email", with: "foo@example.com"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "password"

      click_on "Sign Up!"

      page.should have_content("Thanks for signing up!")
    end
  end
end