require "spec_helper"

describe Locations::Location do
  describe "#all_grouped_by_state" do
    it "returns a hash of states and orders locations by name" do
      wave2 = create_standing_wave(state_abbreviation: "CO", name: "BB")
      wave1 = create_standing_wave(state_abbreviation: "CO", name: "AA")
      wave3 = create_standing_wave(state_abbreviation: "CA")

      Locations::Location.all_grouped_by_state.should == {
          "CA" => [wave3],
          "CO" => [wave1, wave2]
      }
    end
  end
end