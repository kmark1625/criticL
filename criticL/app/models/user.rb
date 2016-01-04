class User < ActiveRecord::Base
  has_many :reviews
  has_many :movies, foreign_key: "creator_id"
  has_many :votes, foreign_key: "voter_id"
end
