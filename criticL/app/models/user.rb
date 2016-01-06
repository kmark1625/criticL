class User < ActiveRecord::Base
  has_many :reviews, foreign_key: "reviewer_id"
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

end

