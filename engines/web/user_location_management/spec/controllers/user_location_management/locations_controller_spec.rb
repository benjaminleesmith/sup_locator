require 'spec_helper'

describe UserLocationManagement::LocationsController do
  let(:user) { create_user }

  before do
    session[:user_id] = user.id
  end

  describe "DELETE destroy" do
    it "successfully deletes the location" do
      location = create_standing_wave name: "Wave to be deleted", user_id: user.id

      delete :destroy, id: location.id

      Locations::Location.find_by_id(location.id).deleted.should == true
      response.should redirect_to controller.locations_url
    end

    it "handles the case where location is missing" do
      delete :destroy, id: 9999999

      flash[:error].should == "Invalid Location"
    end

    it "does not allow unowned location to be deleted" do
      location = create_standing_wave name: "Other User Location", user_id: create_user({email: "other_user@example.com"}).id, deleted: true

      delete :destroy, id: location.id

      flash[:error].should == "You do not have permission to delete that Location"
    end
  end

  describe "GET index" do
    it "only displays non-deleted locations for the logged in user" do
      location1 = create_standing_wave name: "Displayed Location", user_id: user.id
      create_standing_wave name: "Deleted Location", user_id: user.id, deleted: true
      create_standing_wave name: "Other User Location", user_id: create_user({email: "other_user@example.com"}).id, deleted: true

      get :index

      assigns(:locations).should == [location1]
    end
  end
end