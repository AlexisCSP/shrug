function messageForm() {
  $(document).on('turbolinks:load', function() {
    submitNewMessage();
    $("#messages").scrollTop(function() { return this.scrollHeight; });
    $('textarea#message_body').focus()
  });

  $(document).ready(function(){
      $('#new_message :submit').prop('disabled',true);
      $('textarea#message_body').keyup(function(){
          $('#new_message :submit').prop('disabled', isEmpty(this.value) ? true : false);
      })
      $("#new_message").bind("ajax:beforeSend", function(event,xhr,status){
        $('textarea#message_body').val("")
        $('textarea#message_body').focus()
      })
  });
}

function submitNewMessage(){
  $('textarea#message_body').keydown(function(event) {
    if (event.keyCode == 13 && !event.shiftKey) {
        $('[data-send="message"]').click();
        return false;
     }
  });
}

function isEmpty(str) {
    return str.replace(/^\s+|\s+$/gm,'').length == 0;
}
