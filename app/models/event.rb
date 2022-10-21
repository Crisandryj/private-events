class Event < ApplicationRecord
  validates :title, presence: true
  validates :date, presence: true

  has_many :joins
  belongs_to :creator, class_name: 'User'
  has_many :attendees, through: :joins, source: :user

  scope :past, -> {where('date < ?', Date.today)}
  scope :future, -> {where('date > ?', Date.today)}
end
