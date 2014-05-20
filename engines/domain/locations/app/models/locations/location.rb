module Locations
  class Location < ActiveRecord::Base
    DELETION_REASON_CODES = { "WD" => "Wave destroyed", "AI" => "No longer accessible (private property)", "BD" => "Duplicate or Bad information" }
    STATES = { "AL" => "Alabama","AK" => "Alaska","AZ" => "Arizona","AR" => "Arkansas","CA" => "California","CO" => "Colorado","CT" => "Connecticut","DE" => "Delaware","FL" => "Florida","GA" => "Georgia","HI" => "Hawaii","ID" => "Idaho","IL" => "Illinois","IN" => "Indiana","IA" => "Iowa","KS" => "Kansas","KY" => "Kentucky","LA" => "Louisiana","ME" => "Maine","MD" => "Maryland","MA" => "Massachusetts","MI" => "Michigan","MN" => "Minnesota","MS" => "Mississippi","MO" => "Missouri","MT" => "Montana","NE" => "Nebraska","NV" => "Nevada","NH" => "New Hampshire","NJ" => "New Jersey","NM" => "New Mexico","NY" => "New York","NC" => "North Carolina","ND" => "North Dakota","OH" => "Ohio","OK" => "Oklahoma","OR" => "Oregon","PA" => "Pennsylvania","RI" => "Rhode Island","SC" => "South Carolina","SD" => "South Dakota","TN" => "Tennessee","TX" => "Texas","UT" => "Utah","VT" => "Vermont","VA" => "Virginia","WA" => "Washington","WV" => "West Virginia","WI" => "Wisconsin","WY" => "Wyoming"}

    validates :name, presence: true
    validates :deletion_reason, inclusion: { in: DELETION_REASON_CODES.keys + [ nil ], message: "Invalid Reason" }

    def self.all_grouped_by_state
      states_hash = {}
      self.all.order(:name).each do |location|
        states_hash[location.state_abbreviation] ||= []
        states_hash[location.state_abbreviation] << location
      end
      states_hash
    end
  end
end
