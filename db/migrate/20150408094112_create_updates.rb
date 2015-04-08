class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :title
      t.string :summary
      t.string :date

      t.timestamps null: false
    end
  end
end
