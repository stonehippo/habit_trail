$(document).ready(function(){
  $("#add_task").click(function() {
    $(this).hide();
    $("#add_task_form").fadeIn("fast");
  });
  
  $("#cancel_add_task").click(function(){
    $("#add_task_form").slideUp("fast", function(){
      $("#add_task").show();
    });
  });
});