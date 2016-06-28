$(function() {
  //$('.celda_p').css('cursor', 'pointer').click(function(){ show_model("visible");});
  $('.cerrar').css('cursor', 'pointer').click(function() {
    close_models();
  });
  set_modals_actions();
})

function set_modals_actions() {
  $('.nombre').css('cursor', 'pointer').click(function() {
    use_informatin($(".nombre").attr("data_item_name"), $(".nombre").attr("data_item_description"), $(".nombre").attr("data_item_link"), $(".nombre").attr("data_image_zoom"));
  });
  $('.mas_opciones').css('cursor', 'pointer').click(function() {
    show_model_detalle($('.mas_opciones').attr("data_item_family"));
  });
}

function use_informatin(nombre, info, link, imagen) {
  document.getElementById('titulosss').innerHTML = nombre;
  document.getElementById('informacion').innerHTML = info;
  document.getElementById('go_product').href = link;
  document.getElementById('imagen_zoom').src = imagen;
  show_model();
}

function close_models() {
  document.getElementById('bgwindow').style.display = "none";
  document.getElementById('bgwindow_detalles').style.display = "none";
}

function show_model() {

  document.getElementById('bgwindow').style.display = "inline-block";

}

function show_model_image(valor) {

  document.getElementById('imagen_zoom').src = valor;
  document.getElementById('bgwindow').style.display = "inline-block";

}

function show_model_detalle(familia) {
  if (familia == "0") {
    document.getElementById('more_options').innerHTML = "Estas son las distintas opciones de esta promocion";

  } else if (familia == "1") {
    document.getElementById('more_options').innerHTML = "Estas son las distintas opciones de este computador";
    document.getElementById('more_options_des').style.display = "none";
  } else {
    document.getElementById('more_options').innerHTML = "Estas son las distintas opciones de este desodorante";
    document.getElementById('more_options_pc').style.display = "none";
  }
  document.getElementById('bgwindow_detalles').style.display = "inline-block";


}
