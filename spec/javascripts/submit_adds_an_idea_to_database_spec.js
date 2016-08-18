//= require ideas

describe('submitIdea', function() {
    it('submits to database', function(){
      console.log("Test is started");
      var titleElement = document.createElement('input')
      $(titleElement).attr('id', 'title');
      $(titleElement).attr('value', 'Test_Input_Title');
      document.body.appendChild(titleElement);
      var bodyElement = document.createElement('input')
      $(bodyElement).attr('id', 'body')
      $(bodyElement).attr('value', 'Test_Input_body')
      document.body.appendChild(bodyElement);

      submitIdea();
  });
});
