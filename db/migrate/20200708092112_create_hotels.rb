class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name,       null: false
      t.string :hotel_code, null: false
      t.string :phone
      t.boolean :public, default: false
      t.string :city
      t.string :addr_1
      t.text :addr_2
      t.text :desc_s
      t.text :desc
      t.belongs_to :admin
      t.timestamps
    end
  end
end
