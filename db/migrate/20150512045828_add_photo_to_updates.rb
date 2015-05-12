class AddPhotoToUpdates < ActiveRecord::Migration
  def change
  	add_attachment :updates, :photo
  end
end
