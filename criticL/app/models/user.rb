class User < ActiveRecord::Base
  has_many :reviews, foreign_key: "reviewer_id"
  has_many :movies, foreign_key: "creator_id"
  has_many :votes, foreign_key: "voter_id"
  has_many :favorites
  has_many :rated_movies, through: :reviews, source: :movie
  has_many :favorited_movies, through: :favorites, source: :movie

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :email, format: { with: /\w+@\w+\.\w{2,3}/i, message: "please enter a valid email address"}
  has_secure_password

  def favorited?(movie)
    if favorites.exists?(movie_id: movie.id)
      favorites.find_by(movie: movie)
    end
  end
end
