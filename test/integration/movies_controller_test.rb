# test/controllers/movies_controller_test.rb
require "test_helper"
require 'faker'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = User.create!(email: Faker::Internet.unique.email, password: 'password123$')
    sign_in(@user)
  end

  test "should get index" do
    get movies_url
    assert_response :success
  end

  test "should not create a movie with blank URL and redirect to movies path with alert" do
    post movies_url, params: { movie: { url: '' } }
    assert_redirected_to movies_path
    assert_equal 'URL cannot be blank!', flash[:alert]
  end

  test "should create a movie with valid URL and redirect to root path with notice" do
    post movies_url, params: { movie: { url: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ' } }
    assert_redirected_to root_path
    assert_equal 'Sharing successful!', flash[:notice]
  end
end
