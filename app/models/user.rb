class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  mount_uploader :icon_image, ImageUploader
  
  has_many :rooms, dependent: :delete_all
  has_many :reservations, dependent: :delete_all
  
  validates :name, presence: true
  validates :profile, presence: true
  validates :icon_image, presence: true
end
