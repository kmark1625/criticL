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
  validates :rated_movies, uniqueness: true
  validates :email, format: { with: /\w+@\w+\.\w{2,3}/i, message: "please enter a valid email address"}
  has_secure_password

  def favorited?(movie)
    if favorites.exists?(movie_id: movie.id)
      favorites.find_by(movie: movie)
    end
  end

  def score
    sum = 0
    self.reviews.each do |review|
      sum += review.total_votes
    end
    sum
  end

  def self.sorted_by_score
    User.all.sort_by(&:score).reverse
  end

  def owns_review?(review)
    self.reviews.include?(review)
  end

  def already_reviewed?(movie)
    if movie.reviews.any?
      movie.reviews.each do |review|
        self.owns_review?(review)
      end
    else
      return false
    end
  end

  def rank
    # [0: "peasant",10: "trusted",25: "master",50: "legend",100: "the boss",200: "movie god",250: "cineaste", 500: "jedi warrior"]
    case self.score
    when (-100)...(-10)
      "Treasure Troll"
    when (-10)...0
      "Know-Nothing"
    when 0...10
      "Peasant"
    when 10...25
      "Trusted"
    when 25...50
      "Master"
    when 50...100
      "Legend"
    when 100...200
      "THE boss"
    when 200...250
      "Movie god"
    when 250...500
      "Cineaste"
    when 10000000
      "KMONEY $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    else
      "Jedi Warrior (Yoda)"
    end
  end
end
