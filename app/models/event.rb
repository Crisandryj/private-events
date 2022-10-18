class Event < ApplicationRecord
  validates :title, presence: true
  validates :date, presence: true

  has_many :joins
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :attendees, through: :joins, source: :user
end
