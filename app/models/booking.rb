class Booking < ApplicationRecord
    has_many :booking_rooms
    has_many :rooms, through: :booking_rooms
    has_many :hotels, through: :booking_rooms

    accepts_nested_attributes_for :booking_rooms, allow_destroy: true
end
