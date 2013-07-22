require "spec_helper"

describe Users::User do
  module Users
    describe "validations" do
      let(:valid_attributes) {
        {
            email: "some_email@example.com",
            password: "password",
            password_confirmation: "password"
        }
      }

      it "can be valid" do
        user = User.new(valid_attributes)
        user.valid?.should == true
      end

      it "requires the email is unique" do
        create_user(email: "foo@example.com")

        valid_attributes[:email] = "foo@example.com"
        user = User.new(valid_attributes)

        user.valid?.should == false
        user.errors[:email].should == ["has already been taken"]
      end

      it "requires an email" do
        valid_attributes[:email] = ""
        user = User.new(valid_attributes)

        user.valid?.should == false
        user.errors[:email].should == ["can't be blank"]
      end
    end
  end
end