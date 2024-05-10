# test/models/movie_test.rb
require "test_helper"

class MovieTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(email: Faker::Internet.unique.email, password: 'password123$')
  end

  test "should not save movie without user" do
    movie = Movie.new
    assert_not movie.save, "Saved the movie without a user"
  end

  test "should save movie with user" do
    movie = Movie.new(user: @user)
    assert movie.save, "Did not save the movie with a user"
  end
end
