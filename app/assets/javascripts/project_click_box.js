$(document).ready(function(){
  $("#new_project").hide();
  $("#project-opener").hide();
    $("#project-opener").click(function() {
        $("#project-opener").hide()
        $("#new_project").show();
        return false
    });

    $("#project-closer").click(function() {
        $("#new_project").hide();
        $("#project-opener").show()
        return false
    });
});
