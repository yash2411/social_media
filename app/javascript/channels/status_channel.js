import consumer from "./consumer";

consumer.subscriptions.create("StatusChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if (data["status"] == true) {
      document.body.querySelector(
        `.change_user_status_${data["user_id"]}`
      ).innerHTML = "online";
    } else {
      document.body.querySelector(".change_user_status").innerHTML =
        data["last_seen_at"];
    }
    console.log(data["status"]);
  },

  user_status: function () {
    return this.perform("user_status");
  },
});
