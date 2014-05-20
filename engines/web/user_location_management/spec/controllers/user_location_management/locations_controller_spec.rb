require 'spec_helper'

describe UserLocationManagement::LocationsController do
  let(:user) { create_user }

  before do
    session[:user_id] = user.id
  end

  describe "DELETE destroy" do
    it "successfully deletes the location" do
      location = create_standing_wave name: "Wave to be deleted", user_id: user.id
      location.deletion_reason.should == nil

      delete :destroy, id: location.id, deletion_reason: Locations::Location::DELETION_REASON_CODES.keys.first

      location.reload.deletion_reason.should == Locations::Location::DELETION_REASON_CODES.keys.first
      response.should redirect_to controller.locations_url
    end

    it "handles the case where location is missing" do
      delete :destroy, id: 9999999

      flash[:error].should == "Invalid Location"
    end

    it "does not allow unowned location to be deleted" do
      location = create_standing_wave name: "Other User Location", user_id: create_user({email: "other_user@example.com"}).id, deletion_reason: Locations::Location::DELETION_REASON_CODES.keys.first

      delete :destroy, id: location.id

      flash[:error].should == "You do not have permission to delete that Location"
    end

    it "sets a flash error if the location is invalid" do
      location = Locations::Location.new({name: nil, user_id: user.id})
      Locations::Location.stub(:find_by_id).and_return(location)

      delete :destroy, id: location.id

      flash[:error].should == "Unable to delete Location (Name can't be blank)"
    end
  end

  describe "GET index" do
    it "only displays non-deleted locations for the logged in user" do
      location1 = create_standing_wave name: "Displayed Location", user_id: user.id
      create_standing_wave name: "Deleted Location", user_id: user.id, deletion_reason: Locations::Location::DELETION_REASON_CODES.keys.first
      create_standing_wave name: "Other User Location", user_id: create_user({email: "other_user@example.com"}).id

      get :index

      assigns(:locations).should == [location1]
    end
  end

  describe "GET destroy_confirmation" do
    it "displays the confirmation page for the given location" do
      location = create_standing_wave name: "Wave to be deleted", user_id: user.id

      get :destroy_confirmation, id: location.id

      assigns(:location).should == location
      response.should render_template :destroy_confirmation
    end

    it "handles the case where location is missing" do
      get :destroy_confirmation, id: 9999999

      flash[:error].should == "Invalid Location"
      response.should redirect_to controller.locations_url
    end

    it "does not allow unowned location to be deleted" do
      location = create_standing_wave name: "Other User Location", user_id: create_user({email: "other_user@example.com"}).id, deletion_reason: Locations::Location::DELETION_REASON_CODES.keys.first

      get :destroy_confirmation, id: location.id

      flash[:error].should == "You do not have permission to delete that Location"
      response.should redirect_to controller.locations_url
    end
  end
end