class RenameRequiredSkillLevel < ActiveRecord::Migration
  def change
    rename_column :locations_locations, :required_skill_level, :suggested_skill_level
  end
end
