$(document).ready(function(){
  $("#new_education").hide();

    $("#education-opener").click(function() {
        $("#education-opener").hide()
        $("#new_education").show();
        return false
    });

    $("#education-closer").click(function() {
        $("#new_education").hide();
        $("#education-opener").show()
        return false
    });
});
