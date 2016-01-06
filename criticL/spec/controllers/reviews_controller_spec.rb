require "rails_helper"

describe ReviewsController do
  let!(:review) { Review.create!(title: "Great!", rating: 10, content: "This is the best!") }
  let!(:movie) { Movie.create!(title:"The Dark Knight", release_date: "2002-2-2", summary: "I'm Batman!") }

  describe "GET#new" do
    it "renders the new template" do
      user = User.create!(username: "test", email: "test@test.com", password: "password")
      session[:user_id] = user.id
      get :new, :movie_id => movie.id
      expect(review).to render_template("new")
    end

    it "redirects to login page if no current user" do
      get :new, :movie_id => movie.id
      expect(movie).to redirect_to(login_path)
    end

    it "redirects to current movie page if user has already reviewed movie" do
      user = User.create!(username: "test", email: "test@test.com", password: "password")
      session[:user_id] = user.id
      movie.reviews.create(title: "Review", content: "Body", rating: 10, reviewer_id: user.id)
      get :new, :movie_id => movie.id
      expect(movie).to redirect_to(movie)
    end
  end

  describe "POST#create" do
    it "creates a new review" do
      user = User.create(username: "test", email: "email@email.com", password: "password")
      session[:user_id] = user.id
      post :create, review: { title: "Great!", rating: 10, content: "This is the best!" }, :movie_id => movie.id
      expect(review).to be_a(Review)
    end

    it "assigns a new review as @review" do
      user = User.create(username: "test", email: "email@email.com", password: "password")
      session[:user_id] = user.id
      post :create, review: { title: "Great!", rating: 10, content: "This is the best!" }, :movie_id => movie.id
      expect(assigns(:review)).to eq(Review.last)
    end

    it "redirects to the reviewed movie" do
      user = User.create(username: "test", email: "email@email.com", password: "password")
      session[:user_id] = user.id
      post :create, review: { title: "Great!", rating: 10, content: "This is the best!" }, :movie_id => movie.id
      expect(review).to redirect_to(movie)
    end
  end
end