function liveNotif(){
  $(document).ready(function() {
    var currentUrl = window.location.href;
    var userID = currentUrl.substr(currentUrl.lastIndexOf('/') + 1);

    // var userIDArray = []

    // userIDArray.push(userID);
    // //loop through all user ids in the network
    // $.each($('.friend'), function(i,value){
    //   var id  = $(this).text();
    //   console.log(id);
    //   userIDArray.push(id);
    // });

    function loadNewsfeed() {
      // $.each( userIDArray, function(i,value){
         // console.log(value);
        $.ajax({
            type: "GET",
            url: "/profile_pages/" + userID + "/live_notifications"
        });
      // });
    };
    loadNewsfeed();
  });
};

liveNotif();
