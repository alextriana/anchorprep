class AddRelationshipToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :relationship, :string
  	remove_column :users, :type, :string
  end
end
