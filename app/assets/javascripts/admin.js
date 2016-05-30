$(function() {
  $('form').each(function(index) {
    var $form = $(this);
    $form.on('submit', function(ev) {
      validate_form(ev, $form)
    })
  })
})

function validate_form(ev, $form) {
  // Delete older error messages
  $('.error-message').remove();

  var prevent = false

  // Validate required
  $form.find('.required').each(function(index) {
    var label = $(this).find('label').text();
    var value = $(this).find('input').val();
    var type = $(this).find('input').attr('type');
    console.log(type);
    if (type == "text") {
      if (value == "") {
        var error = "Tienes que llenar el campo: " + label
        form_prepend_error($form, error)
        prevent = true
      }
    } else if (type == "number") {
      if (!validate_number(value)) {
        var error = "El campo " + label + " debería ser un número entero"
        form_prepend_error($form, error)
        prevent = true
      }
    }
  })

  // Validate email
  $form.find('.email').each(function(index) {
    var label = $(this).find('label').text();
    var value = $(this).find('input').val();
    if (!validate_email(value)) {
      var error = "El email en el campo " + label + " esta en un formato incorrecto"
      form_prepend_error($form, error)
      prevent = true
    }
  })

  if (prevent) {
    ev.preventDefault()
  }
}

function form_prepend_error($form, error) {
  var error_html = '<div class="error-message">' + error + "</div>"
  $form.prepend(error_html)
}

function validate_email(email) {
  var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
}

function validate_number(number) {
  var re = /^\d+$/;
  return re.test(number);
}


// t("activerecord.attributes.user.password")
