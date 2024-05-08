require "test_helper"
require 'faker'

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(email: Faker::Internet.unique.email, password: 'password123$')
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should sign in the user with valid credentials and redirect to root path with notice" do
    post signup_url, params: { user: { email: @user.email, password: @user.password } }
    assert_redirected_to root_path
    follow_redirect!
    assert_equal 'Sign in successful!', flash[:notice]
  end

  test "should not sign in the user with invalid credentials and render index with alert" do
    post signup_url, params: { user: { email: 'notexistemail@gmail.com', password: 'password' } }
    assert_redirected_to root_path
    follow_redirect!
    assert_equal 'Sign up successful!', flash[:notice]
  end

  test "should not sign up the user with invalid credentials and render index with alert" do
    post signup_url, params: { user: { email: '', password: '' } }
    assert_response :success
    assert_equal 'Invalid email or password. Failed to register.', flash[:alert]
  end

  test "should sign out the user and redirect to root path with notice" do
    delete logout_url
    assert_redirected_to root_path
    follow_redirect!
    assert_equal 'Logged out successfully.', flash[:notice]
  end
end
