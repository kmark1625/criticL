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

  describe "#search_by_title" do
    it "searches for a movie by title and returns a collection of movies" do
      movie3 = Movie.new(title:"The Dark Knight", release_date: "2002-2-2", summary: "I'm Batman!")
      movie3.save
      @movies = Movie.search_by_title("knight")
      expect(@movies.length).to eq 1
    end
    it "returns the movie searched for" do
      movie4 = Movie.new(title:"Iron Man", release_date: "2002-2-2", summary: "I am Iron Man")
      movie4.save
      @movies = Movie.search_by_title("iron")
      expect(@movies[0].title).to eq "Iron Man"
    end
  end
end