require "rails_helper"

describe ReviewsController do
  let!(:review) { Review.create!(title: "Great!", rating: 10, content: "This is the best!") }
  let!(:movie) { Movie.create!(title:"The Dark Knight", release_date: "2002-2-2", summary: "I'm Batman!") }

  describe "GET#new" do
    it "renders the new template" do
      puts review
      get :new, :movie_id => movie.id
      expect(review).to render_template("new")
    end
  end

  describe "POST#create" do
    it "creates a new review" do
      post :create, review: { title: "Great!", rating: 10, content: "This is the best!" }, :movie_id => movie.id
      expect(review).to be_a(Review)
    end
  end
end