class Event < ApplicationRecord
  validates :title, presence: true
  validates :date, presence: true

  has_many :joins
  belongs_to :creator, class_name: "user"
  has_many :attendees, through: "joins", source: "user"
end
