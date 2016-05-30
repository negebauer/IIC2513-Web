$(function() {
  $('form').each(function(index) {
    var $form = $(this);
    $form.on('submit', function(ev) {
      validate_form(ev, $form)
    })
  })
})

function validate_form(ev, $form) {
  // NOTE: DEBUG ONLY!!!
  ev.preventDefault()

  // Validate required
  var $required = $form.find('.required').each(function(index) {
    var label = $(this).find('label').text();
    var value = $(this).find('input').val();
    if (value == "") {
      var error_message = "Tienes que llenar el campo: " + label
      var error_html = '<div class="error-message">' + error_message + "</div>"
      $form.prepend(error_html)
    }
  })
}

function validate_email(email) {
  var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
}


// t("activerecord.attributes.user.password")
