class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: "User"
  belongs_to :movie
  has_many :votes, dependent: :destroy

  validates :title, :rating, :content, { presence: true }

  def total_votes
    sum = 0
    self.votes.each do |vote|
      sum += vote.value
    end
    sum
  end

end
