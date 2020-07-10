class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, :presence => true,
    :confirmation => true,
         :length => {:within => 6..40},
         :on => :create
  validates :password, :confirmation => true,
    :length => {:within => 6..40},
    :allow_blank => true,
    :on => :update
  
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }, format: { without: /\s/ }
  validates :phone,presence: true, length: { minimum: 10, maximum: 11 }

  has_many :hotels
end
