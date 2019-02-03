class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.datetime :issue_date
      t.datetime :return_date
      t.references :book, foreign_key: true
      t.references :book_copy, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
