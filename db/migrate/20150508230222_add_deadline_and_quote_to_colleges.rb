class AddDeadlineAndQuoteToColleges < ActiveRecord::Migration
  def change
  	add_column :colleges, :deadline, :string
  	add_column :colleges, :graduation, :string
  end
end
