function createMessageChannel() {
  App.messages = App.cable.subscriptions.create({
    channel: 'MessagesChannel', chat_room_id: parseInt($("#message_chat_room_id").val())
    },
    {
    received: function(data) {
      $("#messages").removeClass('hidden')
      $('#messages').append(this.renderMessage(data))
      $("#messages").stop().animate({ scrollTop: $("#messages")[0].scrollHeight }, 1000);
    },
    renderMessage: function(data) {
      var msg = data.message.replace(/(?:\r\n|\r|\n)/g, '<br />');
      var close = ": </b>";
      if (data.user == "") {
        close = " </b>";
      }
      return "<p> <b>" + data.user + close + msg + "</p>";
    },
    disconnected: function() {
      App.cable.subscriptions.remove(this)
      this.perform('unsubscribed')
    },
  });

  return App.messages;
}
