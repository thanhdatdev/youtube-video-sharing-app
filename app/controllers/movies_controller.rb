class MoviesController < ApplicationController
  def index
    @movie = Movie.new
  end

  def create
    @movie = movie.find_by(email: movie_params[:email])

    if @movie && @movie.valid_password?(movie_params[:password])
      sign_in(@movie)
      redirect_to root_path, notice: 'Sign in successful!'
    else
      @movie = movie.new(movie_params)

      if @movie.save
        sign_in(@movie)
        redirect_to root_path, notice: 'Sign up successful!'
      else
        flash.now[:alert] = 'Invalid email or password. Failed to register.'
        render :index
      end
    end
  end

  def destroy
    sign_out(current_movie)
    redirect_to root_path, notice: 'Logged out successfully.'
  end

  private

  def movie_params
    params.require(:movie).permit(:url)
  end
end
