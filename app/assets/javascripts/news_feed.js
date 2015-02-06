$(function() {
  var $form = $('#new_review')
  var $formSubmit = $('#create-review')

  $formSubmit.on('click', function(e) {
    e.preventDefault();

    var userId = $form.attr('data-user-id');
    var messageReview = $('#review_message').val();
    var ratingReview = parseInt($('#input-1').val());

    $.ajax({
      url: '/reviews.json',
      data: {
        review: {message: messageReview, rating: ratingReview},
        authenticity_token: $('input[name="authenticity_token"]').val(),
      },
      dataType: 'json',
      method: 'POST'
    }).
    success(function(data) {
      var messageContainer = $("body > div.scroller.slick-initialized.slick-slider > div > div > div.slick-slide.slick-active > h3:last-child");
      messageContainer.prepend(data.username + ": " +
        data.message + " [" +
        data.rating + " stars]") ;
    });
  });

});
