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

  describe "defaults" do
    it "sets the deletion reason to nil" do
      location = Locations::Location.create({name: "test location"})

      location.deletion_reason.should == nil
    end
  end

  describe "validations" do
    describe "deletion_reason" do
      it "validates that the value is a valid reason" do
        Locations::Location::DELETION_REASON_CODES.keys.each do |reason_code|
          location = Locations::Location.new({name: "test location", deletion_reason: reason_code})
          location.valid?.should == true
        end

        location = Locations::Location.new({name: "test location", deletion_reason: nil})
        location.valid?.should == true

        location = Locations::Location.new({name: "test location", deletion_reason: "BAD_CODE"})
        location.valid?.should == false
      end
    end

    describe "name" do
      it "validates presence of name" do
        location = Locations::Location.new({name: nil})

        location.valid?.should == false
        location.errors[:name].present?.should == true
      end
    end
  end
end