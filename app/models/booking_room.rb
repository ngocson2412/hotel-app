class BookingRoom < ApplicationRecord
    belongs_to :booking
    belongs_to :room
    belongs_to :hotel
end
