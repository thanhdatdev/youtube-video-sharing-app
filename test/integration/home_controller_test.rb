require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user.password = @user.password_confirmation = 'password'
    @user.save
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should sign in the user with valid credentials and redirect to root path with notice" do
    post signup_url, params: { user: { email: @user.email, password: 'password' } }
    assert_redirected_to root_path
    follow_redirect!
    assert_equal 'Sign in successful!', flash[:notice]
  end

  test "should not sign in the user with invalid credentials and render index with alert" do
    post signup_url, params: { user: { email: 'invalid@example.com', password: 'wrongpassword' } }
    assert_redirected_to root_path
    follow_redirect!
    assert_equal 'Invalid email or password. Failed to register.', flash[:alert]
  end

  test "should sign up the user with valid credentials and redirect to root path with notice" do
    post signup_url, params: { user: { email: 'new@example.com', password: 'newpassword' } }
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
