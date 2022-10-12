class Event < ApplicationRecord
  validates :title, presence: true
  validates :date, presence: true

  has_many :joins
  belongs_to :creator, foreign_key: "creator_id", class_name: "User"
  has_many :attendees, through: :join, source: "User"
end
