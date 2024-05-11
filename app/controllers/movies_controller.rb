class MoviesController < ApplicationController
  def index
    @movie = Movie.new
  end

  def create
    params = movie_params

    if params[:url].blank?
      redirect_to movies_path, alert: 'URL cannot be blank!'
      return
    end

    params[:url] = embed_youtube_video(params[:url])

    @movie = current_user.movies.new(params)

    if @movie.save!
      ActionCable.server.broadcast('notifications', { movie_url: @movie.url, title: 'Movie Title', user_email: current_user.email })
      redirect_to root_path, notice: 'Sharing successful!'
    else
      flash.now[:alert] = 'Sharing unsuccessful!'
      render :index
    end
  end



  private

  def movie_params
    params.require(:movie).permit(:url)
  end

  def embed_youtube_video(url)
    video_id = url.match(/(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?feature=player_embedded&v=))([\w-]{11})/)[1]
    "https://www.youtube.com/embed/#{video_id}"
  end
end
