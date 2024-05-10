require "test_helper"

class NotificationChannelTest < ActionCable::Channel::TestCase
  def setup
    # Create a user and sign them in
    @user = User.create!(email: 'test@example.com', password: 'password')
    stub_connection current_user: @user

    @movie = @user.movies.create!(url: 'https://www.youtube.com/watch?v=afp6CrtPnJo&list=RDjuHjCwXWGNU&index=23&ab_channel=JenHoang')
  end

  test 'subscribes and streams from notifications' do
    subscribe

    assert subscription.confirmed?
    assert_has_stream 'notifications'
  end

  test 'broadcasts new video' do
    ActionCable.server.broadcast('notifications', { movie_url: @movie.url, title: 'New Video', user_email: @user.email })

    assert_broadcast_on('notifications', movie_url: @movie.url, title: 'New Video', user_email: @user.email)
  end
end
