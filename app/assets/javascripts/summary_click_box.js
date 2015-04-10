$(document).ready(function(){
  $("body > div.profile-info > div > div.new-summary").hide();

    $(document).on('mouseenter', '#summary-opener', function () {
        $(this).find(":button").show();
    }).on('mouseleave', '#summary-opener', function () {
        $(this).find(":button").hide();
    });

    $("#summary-opener").click(function() {
        $("#summary-opener").hide()
        $("body > div.profile-info > div > div.new-summary").show();
        return false
    });

    $("#summary-closer").click(function() {
        $("body > div.profile-info > div > div.new-summary").hide();
        $("#opener").show()
        return false
    });
});
