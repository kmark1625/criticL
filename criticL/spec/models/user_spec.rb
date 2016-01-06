require 'rails_helper'

describe User do
  before(:each) do
    @user = User.new(username: "test", email: "test@test.com", password: "password")
  end

  let(:user) { User.new }
  it "creates a valid user" do
    expect(@user.valid?).to be true
  end

  it "recognizes an invalid email" do
    user = User.new(username: "test", email: "test", password: "password")
    expect(user.valid?).to be false
  end

  describe "#favorited?" do
    it "returns a movie if is favorited" do
       movie = Movie.create!(title: "Deadpool", release_date: "12-2-16", summary: "Chimichangas!")
       @user.favorited_movies << movie
       expect(@user.favorited?(movie)).to eq(movie.favorites.last)
    end
  end
  describe "#score" do
    it "returns the total of the user's review ratings" do
      @user.save
      review = @user.reviews.create(title: "Review", content: "content", rating: 10)
      10.times do |x|
        review.votes.create(value: 1)
      end
      expect(@user.score).to eq(10)
    end
  end

  describe "#owns_review?" do
    it "returns true if user has written a given review" do
      @user.save
      review = @user.reviews.create(title: "Review", content: "content", rating: 10)
      expect(@user.owns_review?(review)).to be true
    end
  end

  describe "#already_reviewed?" do
    it "returns review if user as written a review for a movie" do
      @user.save
      movie = Movie.create!(title: "Deadpool", release_date: "12-2-16", summary: "Chimichangas!")
      review = movie.reviews.create(title: "Review", content: "content", rating: 10, reviewer_id: @user.id)
      expect(@user.already_reviewed?(movie)[0]).to eq(review)
    end
    it "returns false if user has not reviewed movie" do
      @user.save
      movie = Movie.create!(title: "Deadpool", release_date: "12-2-16", summary: "Chimichangas!")
      expect(@user.already_reviewed?(movie)).to be false
    end
  end
  describe "#rank" do
    it "returns the appropriate string based on score" do
      @user.save
      review = @user.reviews.create(title: "Review", content: "content", rating: 10)
      10.times do |x|
        review.votes.create(value: 1)
      end
      expect(@user.rank).to eq("Trusted")
    end
  end
end