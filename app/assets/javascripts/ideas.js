
$(document).ready(function(){

  $(":button[name=submit]").on('click', submitIdea);





});



function submitIdea(){
  console.log("submitIdea is invoked");
  var ideaTitle = $('#title').val();
  var ideaBody = $('#body').val();
  var ideaData = { idea: {title: ideaTitle, body: ideaBody}};
  $.ajax({
    method: "POST",
    url: "/api/v1/ideas/",
    dataType: "JSON",
    data: ideaData,
    success: fetchIdeas
  })
}
