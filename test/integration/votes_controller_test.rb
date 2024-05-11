require "test_helper"
require 'faker'

class VotesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = User.create!(email: Faker::Internet.unique.email, password: 'password123$')
    @movie = Movie.create!(url: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', user: @user)
    sign_in @user
  end

  test "should create vote" do
    assert_difference('@movie.votes.count', 1) do
      post movie_votes_url(@movie), params: { value: 'like' }
    end
    assert_redirected_to root_path
    assert_equal 'Vote was successfully created.', flash[:notice]
  end

  test "should remove vote if already voted" do
    post movie_votes_url(@movie), params: { value: 'like' }
    assert_difference('@movie.votes.where(user: @user).count', -1) do
      post movie_votes_url(@movie), params: { value: 'like' }
    end
    assert_redirected_to root_path
    assert_equal 'Vote was successfully removed.', flash[:notice]
  end

  test "should not create vote if kind is invalid" do
    assert_no_difference('@movie.votes.count') do
      post movie_votes_url(@movie), params: { value: 'invalid' }
    end
    assert_redirected_to root_path
    assert_equal 'Invalid vote kind.', flash[:alert]
  end
end
