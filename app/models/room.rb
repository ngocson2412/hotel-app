class Room < ApplicationRecord
    belongs_to :hotel
    belongs_to :room_type
    has_many :booking_rooms
    has_many :bookings, through: :booking_rooms

    validates :code, presence: true, uniqueness: true
    validates :price, presence: true, format: { with: /\A\d+\z/ }
end
