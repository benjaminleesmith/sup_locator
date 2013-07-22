require 'spec_helper'

describe 'User Signup' do
  context "as a guest" do
    it 'the guest to sign up' do
      expect {
        visit user_management.new_user_path

        fill_in "Email", with: "foo@example.com"
        fill_in "Password", with: "password"
        fill_in "Password Confirmation", with: "password"

        click_on "Sign Up!"
      }.to change{Users::User.count}.by(1  )
    end
  end
end