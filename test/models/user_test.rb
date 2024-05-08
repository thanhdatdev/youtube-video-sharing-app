require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
    user = User.new(password: "password")
    assert_not user.save, "Saved the user without an email"
  end

  test "should not save user with invalid email format" do
    user = User.new(email: "invalid_email", password: "password")
    assert_not user.save, "Saved the user with an invalid email format"
  end
end
