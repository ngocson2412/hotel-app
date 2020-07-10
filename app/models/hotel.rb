class Hotel < ApplicationRecord
    belongs_to :admin
    validates :name, presence: true
    validates :hotel_code, presence: true, uniqueness: true, length: { maximum: 50 }, format: { without: /\s/ }
    validates :phone,presence: true, length: { minimum: 10, maximum: 11 }
end
