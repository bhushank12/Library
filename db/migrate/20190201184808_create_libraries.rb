class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :name
      t.integer :admin_id
      t.string :location

      t.timestamps
    end
  end
end
