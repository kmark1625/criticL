class Movie < ActiveRecord::Base
  has_many :classifications
  has_many :genres, through: :classifications
  has_many :reviews
  belongs_to :creator, class_name: "User"
  has_many :favorites
  has_many :fans, through: :favorites, source: :user

  validates :title, presence: true
  validates :summary, presence: true
end
