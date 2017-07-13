App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden')
    $('#messages').append(this.renderMessage(data))
    $("#messages").stop().animate({ scrollTop: $("#messages")[0].scrollHeight }, 1000);
  },

  renderMessage: function(data) {
    var msg = data.message.replace(/(?:\r\n|\r|\n)/g, '<br />');
    return "<p> <b>" + data.user + ": </b>" + msg + "</p>";
  }
});
