$(function() {
  function blankPredicate() {
    $(".predicate").change(function(event){
      var value =  $(this).val();
      if (value === "blank") {
        $(this).next('input:text').val(true).css("color", "white");
        $(this).next('input:text').hide("fast");
      } else {
        $(this).next('input:text').val("");
        $(this).next('input:text').show("fast");
      }
      return event.preventDefault();
    });
  }

  $("input[value='true']").hide();
  blankPredicate();

  $('form').on('click', '.remove_fields', function(event) {
    var blankTest = $(this).prev('input').val();
    if (blankTest === '') {
      $(this).closest('.field').hide("fast", function(){ $(this).remove(); });
      return event.preventDefault();
    } else {
      $(this).closest('.field').hide("fast", function(){ $(this).remove(); $('#search-form-enrollments').submit(); });
      return event.preventDefault();
    }
  });
  return $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));

    blankPredicate();
  });
});
