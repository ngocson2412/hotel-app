class CreateBookingRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_rooms do |t|
      t.references :hotel, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
