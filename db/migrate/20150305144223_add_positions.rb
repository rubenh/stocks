class AddPositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :symbol, index: true
      t.integer :quantity
      t.decimal :price
      t.decimal :commission

      t.timestamps
    end
  end
end
