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
end