class AddDeadline2ToColleges < ActiveRecord::Migration
  def change
  	add_column :colleges, :early_action, :string, default: "None"
  	add_column :colleges, :early_decision, :string, default: "None"
  	add_column :colleges, :regular_decision, :string, default: "None"
  	remove_column :colleges, :deadline
  	remove_column :colleges, :early_deadline
  end
end
