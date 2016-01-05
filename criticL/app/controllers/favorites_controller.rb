class FavoritesController < ApplicationController


  def create
    @movie = Movie.find_by(id: params[:movie_id])
    current_user = User.find_by(id: session[:user_id])
    @favorite = Favorite.new(movie: @movie, user: current_user)

    if @favorite.save
     respond_to do |format|
      @movie.favorites << @favorite
      current_user.favorites << @favorite
      format.html { redirect_to movie_path(@movie), notice: 'Movie has been favorited' }
      format.json { render :show, status: :created, location: @favorite }
     end
    end
  end

  def destroy
    @movie = Movie.find_by(id: params[:movie_id])
    Favorite.find_by(id: params[:id]).destroy
    redirect_to movie_path(@movie), notice: 'Movie is no longer in favorites'
  end

end
