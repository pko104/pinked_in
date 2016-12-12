$(document).ready(function(){

  $('#message_description').preview({key:'d97cdb9c5b744350a7133b9f477f20b6'});

  function embedly(){
    var preview_data = $('#message_description').data('preview');
    var embedly_html = " <div class='embedly'><a href='" + preview_data.original_url+  "'><img class='embedly-image' src='" + preview_data.thumbnail_url + "'><div class='embedly-text'><div class='embedly-title'>" + preview_data.title + "</div><div class='embedly-description'>" + preview_data.description + "</div></div></a></div>";

    if (preview_data.original_url){
      return embedly_html;
    }
    else{
      return false;
    }
  }

  function toggle(){
    $("#shareChoice").toggle();

    $("#firstChoice").click(function (){
        $("#shareChoice").toggle();
        $("#firstChoice").toggleClass('selected');
        $("#secondChoice,#thirdChoice,#faSecond,#faThird").toggleClass('unselected');
    });

    $("#secondChoice").hover(function(){
        $("#faSecond, #secondChoice").toggleClass('unselected');
    });

     $("#thirdChoice").hover(function(){
        $("#faThird, #thirdChoice").toggleClass('unselected');
    });
  }


  function ajaxFormSubmit(){
    var $form = document.forms[0];
    var $formSubmit = $('#create-message');
    var userId = $('.new_message').attr('data-user');

    $formSubmit.on('click', function(e) {
      e.preventDefault();

      //html object
      var embedly_html = embedly();

      if (embedly_html){
        var descriptionMessage = $('#message_description').val().replace($('#message_description').data('preview').original_url,'');
      }
      else{
        var descriptionMessage = $('#message_description').val();
        embedly_html = '';
      }

      $.ajax({
          url: '/profile_pages/'+ userId + '/newsfeed.json',
          data: {
            message:{
              description: descriptionMessage,
              html: embedly_html,
            },
          },
          dataType: 'html',
          method: 'POST'
        }).
        success(function(data) {
          liveNotif();
          $('#message_description').val('');
          $("#shareChoice").toggle();
          $("#firstChoice").toggleClass('selected');
          $("#secondChoice,#thirdChoice,#faSecond,#faThird").toggleClass('unselected');
        });
    });
  }

  toggle();
  embedly();
  ajaxFormSubmit();
  liveNotif();

});
