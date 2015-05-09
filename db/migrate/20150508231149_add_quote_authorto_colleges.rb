class AddQuoteAuthortoColleges < ActiveRecord::Migration
  def change
  	add_column :colleges, :quote_author, :string
  end
end
