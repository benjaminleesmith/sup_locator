DEPENDENCY_TREE = {
  "engines/domain/locations/" => [],
  "engines/domain/users/" => [],
  "engines/web/guest_location_viewer/" => ["engines/web/shared_ui/", "engines/domain/locations/"],
  "engines/web/shared_ui/" => [],
  "engines/web/user_location_management/" => ["engines/domain/locations/", "engines/domain/users/", "engines/web/shared_ui/"],
  "engines/web/user_management/" => ["engines/domain/users/", "engines/web/shared_ui/"]
}

def changed_files
  changed_files = []
  `git whatchanged origin/master..`.split("\n").each do |line|
    if line.match(/\tengines/)
      match = line.match(/\t(.*)\z/)
      changed_files << match[1]
    end
  end
  changed_files
end

def engines_that_depend_on(engine_path)
  results = []
  DEPENDENCY_TREE.each do |key, value|
    if value.include?(engine_path)
      results << key
      results += engines_that_depend_on(key)
    end
  end
  results
end

changed_engine_paths = []
changed_files.each do |changed_file|
  DEPENDENCY_TREE.keys.each do |engine_path|
    if changed_file.match(engine_path)
      changed_engine_paths << engine_path
    end
  end
end

paths_to_run_tests = []
changed_engine_paths.each do |changed_engine_path|
  paths_to_run_tests << changed_engine_path
  paths_to_run_tests += engines_that_depend_on(changed_engine_path)
end

paths_to_run_tests.flatten.uniq.each do |path_to_run_path_in|
  p "RUNNING TESTS IN #{path_to_run_path_in}"
  # /bin/bash --login &&
  system "echo \'source ~/.rvm/scripts/rvm && cd #{path_to_run_path_in} && ~/.rvm/scripts/rvm use .rvmrc && rspec spec' | /bin/bash"
end

system "echo \'source ~/.rvm/scripts/rvm && ~/.rvm/scripts/rvm use .rvmrc && rspec spec' | /bin/bash"