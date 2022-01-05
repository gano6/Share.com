class Room < ApplicationRecord
  
  # app/models/モデル名.rb
  mount_uploader :image, ImageUploader
  
  belongs_to:users, optional: true
  has_many:reservations
end
