require "rails_helper"

describe MoviesController do
  let!(:movie) { Movie.create!(title: "Deadpool", release_date: "12-2-16", summary: "Chimichangas!" )}

  describe "GET#index" do
    it "assigns all movies as @movies" do
      get(:index)
      expect(assigns(:movies).first).to be_a(Movie)
    end
  end

  describe "GET#show" do
    it "assigns requested movie as @movie" do
      get :show, { id: movie.id }
      expect(assigns(:movie)).to eq(movie)
    end
  end
end