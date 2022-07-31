class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :number_Of_units
      t.datetime :added_at
      t.integer :user_id
      t.timestamps
    end
  end
end
