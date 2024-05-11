# app/helpers/application_helper.rb
module ApplicationHelper
  def user_voted?(movie, value)
    movie.votes.exists?(user: current_user, kind: value)
  end
end
