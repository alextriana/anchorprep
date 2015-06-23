class ChangeUpdates < ActiveRecord::Migration
  def change
  	remove_attachment :updates, :photo
  	add_column :updates, :link, :string
  end
end
