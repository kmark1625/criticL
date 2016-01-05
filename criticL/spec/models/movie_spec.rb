require 'rails_helper'

describe Movie do
  let(:movie) { Movie.new }
  it "creates a valid movie with required parameters" do
    movie = Movie.new(title: "The Avengers", release_date: 2002-2-2, summary: "Explosions!")
    expect(movie.valid?).to be true
  end

  it "recognizes an invalid movie without required parameters" do
    movie = Movie.new(title: "Batman", director: "Tim Burton")
    expect(movie.valid?).to be false
  end

  describe "#calculate_avg" do
    it "calculates and sets a movie's average rating" do
      movie2 = Movie.new(title: "The Avengers", release_date: "2002-2-2", summary: "Explosions!")
      movie2.save
      movie2.reviews.create(rating: 5)
      movie2.reviews.create(rating: 10)
      movie2.calculate_avg
      expect(movie2.avg_rating).to eq 7.5
    end
  end
end