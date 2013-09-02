module Locations
  class Location < ActiveRecord::Base
    validates :name, presence: true
  end
end
