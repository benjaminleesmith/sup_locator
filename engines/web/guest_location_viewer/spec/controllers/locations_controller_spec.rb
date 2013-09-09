require "spec_helper"

describe GuestLocationViewer::LocationsController do
  describe "GET index" do
    it "assigns locations" do
      wave = create_standing_wave state_abbreviation: "CO"

      get :index

      assigns(:locations_by_state_abbreviation).should == {
          "CO" => [wave]
      }
    end
  end
end