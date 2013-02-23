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
        if (data['round'].round.complete){
          debugger
          var url = "/rounds/" + data['round'].round.id
          $(location).attr('href',url)
        }
        else {
          $('.question').html(data['card'].card.question);
          $('.question-number').html('Question number '+ count);
          $('.card-id').attr('value', data['card'].card.id);
        }
      },
      error: function() { 
      },
      complete: function() {
      }

    });
  });
});