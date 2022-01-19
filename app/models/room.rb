class Room < ApplicationRecord
  
  mount_uploader :image, ImageUploader
  
  belongs_to :users, optional: true
  has_many :reservations
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :image, presence: true
  
  
  def self.serch(keyword)
    where(["name like? OR address like?" , "%#{keyword}%", "%#{keyword}%"])
  end
end
