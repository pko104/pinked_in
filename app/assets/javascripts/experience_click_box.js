$(document).ready(function(){
  $("#new_experience").hide();
  $("#experience-opener").hide();
    $("#experience-opener").click(function() {
        $("#experience-opener").hide()
        $("#new_experience").show();
        return false
    });

    $("#experience-closer").click(function() {
        $("#new_experience").hide();
        $("#experience-opener").show()
        return false
    });
});
