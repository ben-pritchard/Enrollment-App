// Make eligibility sub state drop down dynamic on New Enrollment form

$(function() {
  $('#enrollment_eligibility_sub_state_id').parent().hide();
  var sub_states = $('#enrollment_eligibility_sub_state_id').html();

  $('#enrollment_eligibility_state_id').change(function(e) {
    var state = $('#enrollment_eligibility_state_id :selected').text();
    var options = $(sub_states).filter("optgroup[label=" + state + "]").html()
    if (options) {
      $('#enrollment_eligibility_sub_state_id').html(options);
      $('#enrollment_eligibility_sub_state_id').parent().show("fast");
      return e.preventDefault();
    } else {
      $('#enrollment_eligibility_sub_state_id').empty();
      $('#enrollment_eligibility_sub_state_id').parent().hide("fast");
      return e.preventDefault();
    }
  });
});
