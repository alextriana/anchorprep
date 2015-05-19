class RemoveFactsFromCollege < ActiveRecord::Migration
  def change
  	remove_column :colleges, :fact1
  	remove_column :colleges, :fact2
  	remove_column :colleges, :fact3
  	remove_column :colleges, :fact4
  	remove_column :colleges, :fact5
  	remove_column :colleges, :fact6
  	remove_column :colleges, :fact_count
  	add_column :colleges, :facts, :text
  end
end
