$(document).ready(function(){
$("#shareChoice").hide();


    $("#firstChoice").click(function(){
        $("#shareChoice").toggle()
        $("#firstChoice").toggleClass('selected');
        $("#secondChoice,#thirdChoice,#faSecond,#faThird").toggleClass('unselected');
    });

    $("#secondChoice").hover(function(){
        $("#faSecond, #secondChoice").toggleClass('unselected');
    });

     $("#thirdChoice").hover(function(){
        $("#faThird, #thirdChoice").toggleClass('unselected');
    });
});
