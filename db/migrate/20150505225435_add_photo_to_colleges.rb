class AddPhotoToColleges < ActiveRecord::Migration
  def self.up
    add_attachment :colleges, :photo
  end

  def self.down
    remove_attachment :colleges, :photo
  end
end
