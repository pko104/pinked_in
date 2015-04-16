$(document).ready(function(){
  $("#new_summary").hide();
  $("#summary-opener").hide();
    $("#summary-opener").click(function() {
        $("#summary-opener").hide();
        $("#new_summary").show();
        return false
    });

    $("#summary-closer").click(function() {
        $("#new_summary").hide();
        $("#opener").show();
        return false
    });
});
