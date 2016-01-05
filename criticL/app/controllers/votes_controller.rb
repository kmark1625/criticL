class VotesController < ApplicationController
  # before_action :set_vote, only: [:update]

  # POST /movies/:movie_id/reviews/:review_id/votes
  # POST /movies/:movie_id/reviews/:review_id/votes.json
  def create
    @movie = Movie.find_by(id: params[:movie_id])
    @review = @movie.reviews.find_by(id: params[:review_id])

    if vote = Vote.where(review: @review, voter: current_user).first
      vote.destroy
    end

    @vote = Vote.new(value: params[:value])
    # respond_to do |format|
    # !already_voted? &&
    @vote.review = @review
    @vote.voter = current_user
      if @vote.save
        redirect_to movie_path(@movie)
      else
        @error = "You already voted."
        render :template => "movies/show"
          # format.html { redirect_to movie_path(@movie), notice: 'Thank you for your feedback.' }
          # format.json { render :show, status: :created, location: @vote }
          # format.html { render :new }
          # format.json { render json: @vote.errors, status: :unprocessable_entity }
      # end
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:value, :review_id, :voter_id)
    end

    # def already_voted?
    #   @movie = Movie.find_by(id: params[:movie_id])
    #   @review = @movie.reviews.find_by(id: params[:review_id])
    #   @review.votes.each do |vote|
    #     if current_user.votes.include?(vote)
    #       return true
    #     end
    #   end
    #   return false
    # end
end
