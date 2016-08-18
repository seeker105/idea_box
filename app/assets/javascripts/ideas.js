
$(document).ready(function(){
  fetchIdeas();

  $(":button[name=submit]").on('click', submitIdea);
  $("#ideasDiv").on('click', ".delete-button", startDelete);
  $("#ideasDiv").on('click', ".thumbs-up-button", incrementQuality);
  $("#ideasDiv").on('click', ".thumbs-down-button", decrementQuality);
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
    ideasDiv.append('<div class="row" id="' + idea.id + '">' + '\
<input type="button" name="delete" value="Delete" class="btn btn-default pull-right delete-button"> \
<input type="button" name="thumbs-up-button" value="Thumbs Up" class="btn btn-default pull-right thumbs-up-button"> \
<input type="button" name="thumbs-down-button" value="Thumbs Down" class="btn btn-default pull-right thumbs-down-button"> \
Title: ' + idea.title + ' Body: ' + idea.body + ' Quality: ' + idea.quality + '</div><br />');
  });
};

function startDelete(){
  $.ajax({
    method: "DELETE",
    url: "/api/v1/ideas/" + this.parentElement.id,
    dataType: "text",
    success: fetchIdeas
  })
};

function incrementQuality(){
  $.ajax({
    method: "POST",
    url: "/api/v1/increment/" + this.parentElement.id,
    dataType: "text",
    success: fetchIdeas
  })
};

function decrementQuality(){
  $.ajax({
    method: "POST",
    url: "/api/v1/decrement/" + this.parentElement.id,
    dataType: "text",
    success: fetchIdeas
  })
};
