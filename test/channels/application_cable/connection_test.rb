require 'test_helper'

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  test "connects with verified user" do
    user = User.create!(email: Faker::Internet.unique.email, password: 'password123$')
    env = { 'warden' => Object.new.tap { |o| o.singleton_class.class_eval { def user; user; end } } } # Stubbing the environment with a verified user

    connection = ApplicationCable::Connection.new(ActionCable::Connection::Env.new(env))

    assert connection.connect
    assert_equal user, connection.current_user
  end

  test "rejects unauthorized connection" do
    env = {}

    connection = ApplicationCable::Connection.new(ActionCable::Connection::Env.new(env))

    assert_raises ActionCable::Connection::AuthorizationError do
      connection.connect
    end
    assert_nil connection.current_user
  end
end
