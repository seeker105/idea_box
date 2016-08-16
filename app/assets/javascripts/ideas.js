
$(document).ready(function(){

  $(":button[name=submit]").on('click', function(){
    console.log("button was clicked");
    var ideaTitle = $('#title').val();
    var ideaBody = $('#body').val();
    ideaData = { idea: {title: ideaTitle, body: ideaBody} }
    debugger;
    $.ajax({
      method: "POST",
      url: "/api/v1/ideas",
      dataType: "JSON",
      error: function(errorResponse){
        console.log("Error")
      }
    })
  })

});
