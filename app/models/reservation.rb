class Reservation < ApplicationRecord
  
  belongs_to :user, optional: true
  belongs_to :room, optional: true
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :person_num, presence: true
end
