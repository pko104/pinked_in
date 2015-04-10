   $(document).ready(function(){
      $("body > div.profile-info > div > div.new-summary").hide();

        $("#opener").click(function() {
            $("body > div.profile-info > div > div.new-summary").show();
            return false
        });
    });
