class AddFieldsToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :title, :string
  	add_column :events, :date, :string
  	add_column :events, :summary, :string
  	add_attachment :events, :photo
  end
end
