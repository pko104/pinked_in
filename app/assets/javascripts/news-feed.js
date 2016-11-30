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
          alert('hi');

        //  console.log(data);

      //    $(".newsfeed-post").clone().appendTo("#newsfeed");


          // messageContainer.prepend( $('.newsfeed-post').clone() )
    //       messageContainer.prepend(
    //       "<%@user = User.find(" + data.user_id + ")%>"+
    //         "<div class='newsfeed-post'>"+
    //           "<div class='newsfeed-avatar'>"+
    //             "<% if @user.avatar.path == nil %>"+
    //               "<img src=<%=image_path('cat.png')%> />"+
    //             "<%else%>"+
    //               "<img src=<%= @user.avatar%> alt =<%= 'avatar'%> />"+
    //             "<%end%>"+
    //         "</div>"+

    //       "<div class = 'newsfeed-info'>"+
    //         "<div class='newsfeed-name'>"+
    //           "<h1>"+
    //             "<%=@user.first_name + ' ' + @user.last_name}%>"+
    //           "</h1>"+
    //           "<h2>"+
    //             "<%if posts.user.experiences[0]%>"+
    //               "<%=posts.user.experiences[0].title + ' at ' + posts.user.experiences[0].company_name}%>"+
    //             "<%else%>"+
    //               "<%=''%>"+
    //             "<%end%>"+
    //           "</h2>"+
    //         "</div>"+

    //     "<div class='newsfeed-description'>" + data.description + "</div>"+

    //     // <div class='newsfeed-like'>
    //     //   <%if posts.liked_ids_array%>
    //     //     <%=liked = posts.liked_ids_array.split(',')%>
    //     //       <%if liked.length == 1%>
    //     //         <%= "#{liked[0].user.first_name + " " +liked[0].user.last_name + "likes this."}"%>
    //     //       <%elsif liked.length == 2%>
    //     //         <%= "#{liked[0].user.first_name + " " + liked[0].user.last_name + " and " + liked[1].user.first_name + " " + liked[1].user.last_name + "likes this."}"%>
    //     //       <%else%>
    //     //           <%="Likes (#{liked})"%>
    //     //       <%end%>
    //     //   <%else%>
    //     //     <%="Likes (0)"%>
    //     //   <%end%>
    //     // </div>

    //   "</div>"+

    // "</div>");




        });
    });
  }

  embedly();
  ajaxFormSubmit();

});
