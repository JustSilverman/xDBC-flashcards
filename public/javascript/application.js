var count = 1;

$(document).ready(function(){
  $('.guess-form').submit(function(e){
    e.preventDefault();
    count++;
    $.ajax({
      url: this.action,
      type: "POST",
      data: $(this).serialize(),
      dataType: "json",
      success: function(data, status) {
        $('.question').html(data['card'].question);
        $('.question-number').html('Question number '+count);
      },
      error: function() {      
      },
      complete: function() {
      }

    });
  });
});