puts "RUNNING SMART TEST SUITE"

DEPENDENCY_TREE = {
  "engines/domain/location" => [],
  "engines/domain/users" => [],
  "engines/web/guest_location_viewer" => ["engines/web/shared_ui", "engines/domain/location"],
  "engines/web/shared_ui" => [],
  "engines/web/user_location_management" => ["engines/domain/location", "engines/domain/users", "engines/web/shared_ui"],
  "engines/web/user_management" => ["engines/domain/users", "engines/web/shared_ui"]
}

#always run wrapper app tests