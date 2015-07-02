class AddBasicsToColleges < ActiveRecord::Migration
  def change
  	add_column :colleges, :basics, :text
  end
end
