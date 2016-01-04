class Movie < ActiveRecord::Base
  has_many :classifications
  has_many :genres, through: :classifications
  has_many :reviews
  belongs_to :creator, class_name: "User"

  validates :title, presence: true
  validates :release_date, presence: true
  validates :summary, presence: true
end
