class Movie < ActiveRecord::Base
  has_many :classifications
  has_many :genres, through: :classifications
  has_many :reviews
  belongs_to :creator, class_name: "User"
  has_many :favorites
  has_many :fans, through: :favorites, source: :user

  validates :title, presence: true
  validates :summary, presence: true

  def calculate_avg
    total = 0
    self.reviews.each do |review|
      total += review.rating
    end
    self.avg_rating = total/self.reviews.length
    self.save
  end
end
