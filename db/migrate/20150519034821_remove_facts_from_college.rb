class RemoveFactsFromCollege < ActiveRecord::Migration
  def change
  	add_column :colleges, :facts, :text
  end
end
