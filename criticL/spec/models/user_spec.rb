require 'rails_helper'

describe User do
  let(:user) { User.new }
  it "creates a valid user" do
    user = User.new(username: "test", email: "test@test.com", password: "password")
    expect(user.valid?).to be true
  end

  it "recognizes an invalid email" do
    user = User.new(username: "test", email: "test", password: "password")
    expect(user.valid?).to be false
  end

  describe "#favorited?" do
    it "returns a movie if is favorited" do
       user = User.create!(username: "test", email: "test@test.com", password: "password")
       movie = Movie.create!(title: "Deadpool", release_date: "12-2-16", summary: "Chimichangas!")
       user.favorited_movies << movie
       expect(user.favorited?(movie)).to eq(movie)
    end
  end
end