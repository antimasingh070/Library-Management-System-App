class CreateBookRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :book_roles do |t|
      t.integer :book_id
      t.integer :role_id
      t.datetime :issue_date
      t.timestamps
    end
  end
end
