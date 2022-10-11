class Event < ApplicationRecord
  validates :title, presence: true
  validates :date, presence: true
  
  belongs_to :creator, foreign_key:"creator_id" class_name: "User"
end
