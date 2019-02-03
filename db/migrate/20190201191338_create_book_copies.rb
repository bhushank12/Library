class CreateBookCopies < ActiveRecord::Migration[5.2]
  def change
    create_table :book_copies do |t|
      t.string :reg_number
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
