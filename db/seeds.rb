# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   name: 'admin',
   email: 'admin@localhost.com',
   password: 'admin123',
   is_admin: true,
   phone: '01234567890'
)

Hotel.create!(
   name: 'hotel name 1',
   hotel_code: 'hotel01',
   city: 'Hai Phong',
   addr_1: 'Vinh Bao',
   addr_2: 'Tran Duong',
   admin_id: 1,
   phone: '01234567890'
)
