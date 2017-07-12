$(document).on('turbolinks:load', function() {
  submitNewMessage();
  $("#messages").scrollTop(function() { return this.scrollHeight; });
  $('textarea#message_body').focus()
});

function submitNewMessage(){
  $('textarea#message_body').keydown(function(event) {
    if (event.keyCode == 13) {
        $('[data-send="message"]').click();
        $('textarea#message_body').val(" ")
        return false;
     }
  });
}