$(document).ready(function(){
  var count = 1;
  $('.guess-form').submit(function(e){
    e.preventDefault();
    count++;
    $.ajax({
      url: this.action,
      type: "POST",
      data: $(this).serialize(),
      dataType: "json",
      success: function(data, status) {
        if (data['round'] == undefined){
          $('.question').html(data['card'].question);
          $('.question-number').html('Question number '+count);
        }
        else {
          debugger
          // $(location).("/rounds/" + data['round'].id);
        }
      },
      error: function() { 
      },
      complete: function() {
        // data['round'].complete == true
      }

    });
  });
});