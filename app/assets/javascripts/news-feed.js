$(function() {
  var $form = document.forms[0];
  var $formSubmit = $('#create-message')

  $formSubmit.on('click', function(e) {
    e.preventDefault();

    var descriptionMessage = $('#message').val();

    $.ajax({
      url: '/profile_pages/1/newsfeed.json',
      data: JSON.stringify(description: descriptionMessage),
      },
      dataType: 'json',
      method: 'POST'
    }).
    success(function(data) {
      var messageContainer = $("body > div.news_feed > div.message_feed");
      messageContainer.prepend(data.description);
    });
  });

});

