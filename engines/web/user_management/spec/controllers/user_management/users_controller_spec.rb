require "spec_helper"

describe UserManagement::UsersController do
  describe "GET new" do
    it "news up a user" do
      get :new
      assigns(:user).should be_a_new Users::User
    end
  end

  describe "POST create" do
    it "creates a user and redirects" do
      session[:return_to] = "/"

      expect {
        post :create, user: {email: "foo@example.com", password: "password", password_confirmation: "password"}
      }.to change{Users::User.count}.by(1)

      user = Users::User.last
      user.email.should == "foo@example.com"
      user.authenticate("password").should be

      response.should redirect_to "/"
    end

    it "rerenderes the page on error" do
      expect {
        post :create, user: {email: "foo@example.com", password: "password", password_confirmation: "asdf"}
      }.to change{Users::User.count}.by(0)

      response.should render_template "new"
    end
  end
end
