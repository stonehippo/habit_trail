// TODO implement submit function behavior for add task (sends an XHR to backend...)
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
  
  $(".task_update").click(function() {
    // TODO send XHR to backend to update the current task
    $(this).parent().hide();
  });
});