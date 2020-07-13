class Room < ApplicationRecord
  belongs_to :hotel
  belongs_to :room_type

  validates :code, presence: true, uniqueness: true
  validates :price, presence: true, format: { with: /\A\d+\z/ }
end
