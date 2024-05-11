require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  setup do
    @user = User.create!(email: Faker::Internet.unique.email, password: 'password123$')
    @movie = Movie.create!(url: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', user: @user)
  end

  test "should save vote with valid attributes" do
    vote = Vote.new(user: @user, movie: @movie, kind: 'like')
    assert vote.save, "Vote was not saved with valid attributes"
  end

  test "should not save vote without user" do
    vote = Vote.new(movie: @movie, kind: 'like')
    assert_not vote.save, "Vote was saved without a user"
  end

  test "should not save vote without movie" do
    vote = Vote.new(user: @user, kind: 'like')
    assert_not vote.save, "Vote was saved without a movie"
  end
end
