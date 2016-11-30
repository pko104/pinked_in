// $(document).ready(function(){

//     $("#firstChoice").click(function(){
//         $("#shareChoice").toggle();
//         $("#firstChoice").toggleClass('selected');
//         $("#secondChoice,#thirdChoice,#faSecond,#faThird").toggleClass('unselected');
//     });

//     $("#secondChoice").hover(function(){
//         $("#faSecond, #secondChoice").toggleClass('unselected');
//     });

//      $("#thirdChoice").hover(function(){
//         $("#faThird, #thirdChoice").toggleClass('unselected');
//     });

//     // function embed(){
//     //     // Set up preview.
//     //     $('#message_description').preview({key:'d97cdb9c5b744350a7133b9f477f20b6'});

//     //     // $('.new_message').on('submit', function(){

//     //     // var preview_data = $('#message_description').data('preview');
//     //     // var embedly_html = "<div class='embedly'><a href='" + preview_data.original_url+  "'><img class='embedly-image' src='" + preview_data.thumbnail_url + "'><div class='embedly-text'><div class='embedly-title'>" + preview_data.title + "</div><div class='embedly-description'>" + preview_data.description + "</div></div></a></div>";

//     //     // $('#message_description').append(embedly_html);

//     //     //   alert('hi');
//     //     //   return true;
//     //     // });


//     // $('.new_message').submit(function() {

//     //     var userId = $('.new_message').attr('data-user');
//     //     var preview_data = $('#message_description').data('preview');

//     //     $.ajax({
//     //         type: "POST",
//     //         url: '/profile_pages/'+ userId + '/newsfeed.json',
//     //         data: JSON.stringify({'body': userId}),
//     //         dataType: "json",
//     //     }).success(function(json){
//     //         console.log("success");
//     //     });
//     //     return false;
//     // });


//     // }






//     $('#new_message').on('submit', function(){
//       // Preview data.
//       var preview = $('#message_description').data('preview');

//       // Close the selector
//       $('#message_description').trigger('close');
//       $('#message_description').val('');

//       // Create a post using mustache, i.e. the nice way.
//       var template = ['<div class="row">',
//         '<div class="large-3 columns">',
//           '<img class="thumb" src="{{thumbnail_url}}"></img>',
//         '</div>',
//         '<div class="large-9 column">',
//           '<a href="{{original_url}}">{{title}}</a>',
//           '<p>{{description}}</p>',
//         '</div>',
//       '</div>'].join('');

//       html = template.to_html;
//       // html = $(Mustache.to_html(template, preview));
//       // html.data('preview', preview);
//       // html.on('click', function(){
//       //   var data = $(this).data('preview');
//       //   // Insert the video or rich object.
//       //   if (data.media.type === 'video' || data.media.type === 'rich'){
//       //     $(this).html(data.media.html);
//       //     return false;
//       //   }
//       //   return true;
//       // });
//       // Display the item in the feed.
//       $('.newsfeed-post').append(html);
//       return false;
//     });




// });
