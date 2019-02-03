class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :no_of_copies
      t.references :library, foreign_key: true

      t.timestamps
    end
  end
end
