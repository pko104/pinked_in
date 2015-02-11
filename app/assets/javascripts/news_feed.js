$(function() {
  var $form = document.forms[0];
  var $formSubmit = $('#create-message')

  $formSubmit.on('click', function(e) {
    e.preventDefault();

    //var userId = $form.attr('data-user-id');
    var descriptionMessage = $('#message').val();


    $.ajax({
      url: '/profile_pages/1/newsfeed.json',
      data: JSON.stringify(description: descriptionMessage),
       // authenticity_token: $('input[name="authenticity_token"]').val(),
      },
      dataType: 'json',
      method: 'POST'
    }).
    success(function(data) {
     // var nameContainer = $("body > div.news_feed > h3:first-child");
     // nameContainer.prepend(data.first_name + data.last_name);
      var messageContainer = $("body > div.news_feed > div.message_feed");
      messageContainer.prepend(data.description);
      //var likedContainer = $("body > div.news_feed > div.liked_feed");
      //likedContainer.prepend(data.liked);
    });
  });

});


