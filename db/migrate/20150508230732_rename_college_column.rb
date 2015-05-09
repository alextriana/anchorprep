class RenameCollegeColumn < ActiveRecord::Migration
  def change
  	rename_column :colleges, :graduation, :quote
  end
end
