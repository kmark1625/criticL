class Vote < ActiveRecord::Base
  belongs_to :review
  belongs_to :voter, class_name: "User"

  # validates :voter, uniqueness: {scope: :review}
  validates :review, presence: :true
end
