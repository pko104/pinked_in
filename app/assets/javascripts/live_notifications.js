function liveNotif(){
  $(document).ready(function() {
    var currentUrl = window.location.href;

    // Given that we're at a url like 'users/:id', this saves the unique id of the user whose show page we are currently looking at
    var userID = currentUrl.substr(currentUrl.lastIndexOf('/') + 1);

    function loadNewsfeed() {
        $.ajax({
            type: "GET",
            url: "/profile_pages/" + userID + "/live_notifications"
        });
    }
    loadNewsfeed();

    // setInterval(function() {
    //     $.ajax({
    //         type: "GET",
    //         url: "/profile_pages/" + userID + "/live_notifications"
    //     });
    // }, 3000);

  });
};

liveNotif();
