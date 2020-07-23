class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :check_in_day
      t.boolean :pay_flag, default: false
      t.string :book_status
      t.datetime :check_out_day
      t.string :book_user_name, null: false
      t.string :book_user_phone, null: false
      t.string :book_user_number, null: false
      t.integer :book_people_number, default: 0
      t.integer :book_total_amount, default: 0
      t.text :book_memo

      t.timestamps
    end
  end
end
