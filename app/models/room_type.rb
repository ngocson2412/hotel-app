class RoomType < ApplicationRecord
    has_many :rooms

    validates :name, presence: true, uniqueness: true
end
