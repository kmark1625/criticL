class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /movies/:movie_id/reviews
  # GET /movies/:movie_id/reviews.json
  def index
    @reviews = Review.all
  end

  # GET /movies/:movie_id/reviews/1
  # GET /movies/:movie_id/reviews/1.json
  def show
  end

  # GET /movies/:movie_id/reviews/new
  def new
    @movie = Movie.find_by(id: params[:movie_id])
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /movies/:movie_id/reviews
  # POST /movies/:movie_id/reviews.json
  def create
    @movie = Movie.find_by(id: params[:movie_id])
    @review = Review.new(review_params)
    current_user = User.find_by(id: session[:user_id])

    respond_to do |format|
      if @review.save
        @movie.reviews << @review
        current_user.reviews << @review
        @movie.calculate_avg
        format.html { redirect_to @movie, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/:movie_id/reviews/1
  # PATCH/PUT /movies/:movie_id/reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/:movie_id/reviews/1
  # DELETE /movies/:movie_id/reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:reviewer_id, :movie_id, :rating, :content, :title)
    end
end
