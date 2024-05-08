import consumer from "channels/consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {
    console.log('connected')
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    console.log('disconnected');
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    alert(`New video shared by ${data.user_email}: ${data.title}`);
  }
});
