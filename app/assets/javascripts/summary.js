$(function() {
  var $form = $('#new-summary');
  var $formSubmit = $('#submit-summary')

  $formSubmit.on('click', function(e) {
    e.preventDefault();

    var userId = $form.attr('data-user-id');
    var descriptionMessage = $('#description').val();

    $.ajax({
      url: '/profile_pages/'+ userId +'/profile.json',
      data: {description: descriptionMessage},
      dataType: 'json',
      method: 'POST'
    }).
    success(function(data) {
      var messageContainer = $("#summary_description");
      messageContainer.prepend(data.description);
    });
  });

});


