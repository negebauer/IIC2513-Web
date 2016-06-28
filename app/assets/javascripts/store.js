$(function() {
  $("button[name=Previous]").on('click', toogle_hidden_cells_previous);
  $("button[name=Next]").on('click', toogle_hidden_cells_next);
  //$('.celda_p').css('cursor', 'pointer').click(function(){ show_model("visible");});
  $('.cerrar').css('cursor', 'pointer').click(function(){ close_models();});
  set_modals_actions();
})

function set_modals_actions(){
  $('.nombre').css('cursor', 'pointer').click(function(){ use_informatin($(".nombre").attr("data_item_name"), $(".nombre").attr("data_item_description"), $(".nombre").attr("data_item_link"),$(".nombre").attr("data_image_zoom"));});
  $('.mas_opciones').css('cursor', 'pointer').click(function(){ show_model_detalle(  $('.mas_opciones').attr("data_item_family"));});
}

function use_informatin(nombre, info, link, imagen){

  document.getElementById('titulosss').innerHTML = nombre;
  document.getElementById('informacion').innerHTML = info;
  document.getElementById('go_product').href = link;
  document.getElementById('imagen_zoom').src = imagen;
  show_model();
}

function toogle_hidden_cells_previous(ev) {
  ev.preventDefault();
  toogle_hidden_cells(false);
}

function toogle_hidden_cells_next(ev) {
  ev.preventDefault();
  toogle_hidden_cells(true);
}

function toogle_hidden_cells(next) {
  var item_count_max = $(".columnas").attr("data_item_count_max");
  var $cells = $(".celda_p");
  var toggled = 0
  var foundvisible = false;
  if (!next) {
    $cells = $($cells.get().reverse()).each(function() { /* ... */ });
  }
  for (index = 0; index < $cells.size(); index++) {
    var $cell = $cells.eq(index);
    if (!foundvisible && !$cell.hasClass('hidden') && $cells.length - index > 10) {
      foundvisible = true;
    }
    if (foundvisible && !$cell.hasClass('hidden')) {
      $cell.addClass('hidden');
    } else if (foundvisible && toggled < item_count_max) {
      toggled += 1;
      $cell.removeClass('hidden');
    } else {
    }
  }
}


function close_models(){
  document.getElementById('bgwindow').style.display = "none";
  document.getElementById('bgwindow_detalles').style.display = "none";
}

function show_model(){

  document.getElementById('bgwindow').style.display = "inline-block";

}

function show_model_image(valor){

  document.getElementById('imagen_zoom').src = valor;
  document.getElementById('bgwindow').style.display = "inline-block";

}
function show_model_detalle(familia){
  if (familia=="0") {
    document.getElementById('more_options').innerHTML = "Estas son las distintas opciones de esta promocion";

  }
  else if (familia == "1") {
    document.getElementById('more_options').innerHTML = "Estas son las distintas opciones de este computador";
    document.getElementById('more_options_des').style.display = "none";
  }
  else {
    document.getElementById('more_options').innerHTML = "Estas son las distintas opciones de este desodorante";
    document.getElementById('more_options_pc').style.display = "none";
  }
  document.getElementById('bgwindow_detalles').style.display = "inline-block";


}
