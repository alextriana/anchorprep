class AddExtraDeadlineToColleges < ActiveRecord::Migration
  def change
  	add_column :colleges, :early_deadline, :string, default: "None"
  end
end
