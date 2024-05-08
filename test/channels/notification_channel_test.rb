require "test_helper"

class NotificationChannelTest < ActionCable::Channel::TestCase
  def setup
    # Create a user and sign them in
    @user = User.create!(email: 'test@example.com', password: 'password')
    stub_connection current_user: @user
  end

  test 'subscribes and streams from notifications' do
    subscribe

    assert subscription.confirmed?
    assert_has_stream 'notifications'
  end

  test 'broadcasts new video' do
    ActionCable.server.broadcast('notifications', { title: 'New Video', user_email: @user.email })

    assert_broadcast_on('notifications', title: 'New Video', user_email: @user.email)
  end
end
