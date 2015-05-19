class ChangeCollege < ActiveRecord::Migration
  def change
  	remove_column :colleges, :summary
  	add_column :colleges, :website, :string
  	add_column :colleges, :location, :string
  	add_column :colleges, :other, :string
  	add_column :colleges, :fact_count, :string
  end
end
