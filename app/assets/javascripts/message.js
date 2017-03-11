$(document).on('turbolinks:load', function(){
  function buildHTML(message) {
    var li = '<li class="body">',
        date = '<div class="name-date"><div class="name-date__name">' + message.user_name + '</div><div class="name-date__date"> ' + message.time +' </div></div>',
        message = '<div class="message">'+ message.body + '</div>';
    var html = li+ date + message;
    return html;
  }

  $('.send-box__button').on('click', function(e) {
    e.preventDefault();
    var textField = $('.message_area'),
        message = textField.val(),
        data = { message: { body: message } }
    $.ajax({
      type: 'POST',
      url: 'messages',
      data: data,
      dataType: 'json'
    })
    .done(function(data) {
      if (data) {
        var html = buildHTML(data);
      $('.chat_message').append(html);
      textField.val('');
      } else {
        alert("入力しろ！");
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});

