class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @movie = Movie.find(params[:movie_id])
    @vote = @movie.votes.find_by(user: current_user)

    if @vote
      @vote.destroy
      redirect_to root_path, notice: 'Vote was successfully removed.'
    elsif %w[like dislike].include?(params[:value])
      @vote = @movie.votes.new(user: current_user, kind: params[:value])
      if @vote.save
        redirect_to root_path, notice: 'Vote was successfully created.'
      else
        redirect_to root_path, alert: 'Failed to create vote.'
      end
    else
      redirect_to root_path, alert: 'Invalid vote kind.'
    end
  end
end
