$(document).ready(function(){
  $('.signup-dropdown').click(function(){
    $(this).hide();
    $('.signup-form').fadeIn("slow");
  });

  if ($('.validation-errors').length > 0) {
    $('.signup-form').show();
  }

  $('.guess-form').submit(function(e){
    e.preventDefault();
    $.ajax({
      url: this.action,
      type: "POST",
      data: $(this).serialize(),
      dataType: "json",
      success: function(data, status) {
        if (data['round'].round.complete) {
          var url = "/rounds/" + data['round'].round.id
          $(location).attr('href',url)
        }
        else {
          $('.session-message').html(data['message']);
          $('.question').html(data['card'].card.question);
          $('.card-id').attr('value', data['card'].card.id);
          if (data['correct']){
            $('.session-message').addClass('correct');
          } else {
            $('.session-message').removeClass('correct');
          }          
          $('.answer-field').val("");
        }
      },
      error: function() { 
      },
      complete: function() {
      }
    });
  });
});