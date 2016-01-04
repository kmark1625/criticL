class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: "User"
  belongs_to :movie
  has_many :votes
end
