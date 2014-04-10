// $(function(){
//   $(".remove").click(function () {
//     $(this).closest(".well").fadeOut();
//   });
// });


$(function(){

  // $(document).on("click",".remove",function () {
  //   $(this).fadeOut();
  // });

  // $('.add-task').keyup(function(e){
  //   if (e.which === 13) {//the enter key was pressed
  //     $("<li class='remove'>"+$(this).val()+"</li>").appendTo("#task-list");
  //     $(this).val("");
  //   };
  // });
  // 
  
  $('.add-task').focus(function(e){
    if ($(this).text() === "") {
      $("#reverse").text("type some text to reverse");
    };
  });

  $('.add-task').keyup(function(e){
    var reverse = $(this).val().split("").reverse().join("");
    $("#reverse").text(reverse);
  });

});