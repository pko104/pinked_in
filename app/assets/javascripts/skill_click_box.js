$(document).ready(function(){
  $("#new_skill").hide();

    $("#skill-opener").click(function() {
        $("#skill-opener").hide()
        $("#new_skill").show();
        return false
    });

    $("#skill-closer").click(function() {
        $("#new_skill").hide();
        $("#skill-opener").show()
        return false
    });
});
