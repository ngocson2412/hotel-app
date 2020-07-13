class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :code, null: false
      t.integer :price, null: false
      t.references :hotel, null: false, foreign_key: true
      t.references :room_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
