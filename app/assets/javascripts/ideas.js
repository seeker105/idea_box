
$(document).ready(function(){
  fetchIdeas();

  $(":button[name=submit]").on('click', submitIdea);
  $(":button[name=delete]").on('click', delete);
});



function submitIdea(){
  console.log("submitIdea is invoked");
  var ideaTitle = $('#title').val();
  var ideaBody = $('#body').val();
  clearInputFields();
  var ideaData = { idea: {title: ideaTitle, body: ideaBody}, format: "json"};
  $.ajax({
    method: "POST",
    url: "/api/v1/ideas/",
    dataType: "JSON",
    data: ideaData,
    success: fetchIdeas
  })
}

function clearInputFields(){
  $('#title').val('');
  $('#body').val('')
}

function fetchIdeas(){
  $.ajax({
    method: "GET",
    url: "/api/v1/ideas/",
    dataType: "JSON",
    success: renderIdeas
  })
};

function renderIdeas(ideaData){
  ideasDiv = $("#ideasDiv");
  ideasDiv.html(""),
  ideaData.forEach(function(idea){
    ideasDiv.append('<div class="row idea-' + idea.id + '">' + '<input type="button" name="delete" id="' + idea.id + '"value="Delete" class="btn btn-default pull-right">'+ 'Title: ' + idea.title + ' Body: ' + idea.body + ' Quality: ' + idea.quality + '</div><br />');
  });
};

function delete(){
  debugger;
};

function deleteIdea(){};
