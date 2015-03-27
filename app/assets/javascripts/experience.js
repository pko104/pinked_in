$(function() {
  var $form = $('#new-experience');
  var $formSubmit = $('#submit-experience')

  $formSubmit.on('click', function(e) {
    e.preventDefault();

    var userId = $form.attr('data-user-id');
    var titleMessage = $('#title').val();
    var companynameMessage = $('#company_name').val();
    var dateMessage = $('#date').val();
    var descriptionMessage = $('#description').val();

    $.ajax({
      url: '/profile_pages/'+ userId +'/profile.json',
      data: {title: titleMessage,
        company_name: companynameMessage,
        description: descriptionMessage,
        date: dateMessage
      },
      dataType: 'json',
      method: 'POST'
    }).
    success(function(data) {
      var messageContainer = $("#current-experience");
      messageContainer.prepend(data.title + data.company_name + data.date + data.description);
    });
  });

});


