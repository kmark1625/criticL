class User < ActiveRecord::Base
  has_many :reviews, foreign_key: "reviewer_id", dependent: :destroy
  has_many :movies, foreign_key: "creator_id"
  has_many :votes, foreign_key: "voter_id"
  has_many :favorites
  has_many :rated_movies, through: :reviews, source: :movie
  has_many :favorited_movies, through: :favorites, source: :movie






  validates :username, uniqueness: true, presence: true, unless: :provider
  validates :email, uniqueness: true,
                    presence: true,
                    format: { with: /\w+@\w+\.\w{2,3}/i, message: "please enter a valid email address"},
                    unless: :provider

  # validates :password, presence: {scope: :provider,
  #       message: "You must have a password or log in with facebook"}


  # validates :password, presence: true, unless: :provider
  has_secure_password(validations: false)

  def favorited?(movie)
    if favorites.exists?(movie_id: movie.id)
      favorites.find_by(movie: movie)
    end
  end

  def self.from_omniauth(auth)


    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
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

