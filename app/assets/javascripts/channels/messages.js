App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
  	$('textarea#message_body').val(" ")
  	$('textarea#message_body').focus()
    $("#messages").removeClass('hidden')
    $('#messages').append(this.renderMessage(data))
    $("#messages").stop().animate({ scrollTop: $("#messages")[0].scrollHeight }, 1000);
  },

  renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }
});