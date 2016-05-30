$(function() {
  $("button[name=Previous]").on('click', toogle_hidden_cells_previous);
  $("button[name=Next]").on('click', toogle_hidden_cells_next);
  // console.log($cells);
})

function toogle_hidden_cells_previous(ev) {
  ev.preventDefault();
  console.log('toggle previous');
  toogle_hidden_cells(false);
}

function toogle_hidden_cells_next(ev) {
  ev.preventDefault();
  toogle_hidden_cells(true);
}

function toogle_hidden_cells(next) {
  var item_count_max = $(".columnas").attr("data_item_count_max")
  var $cells = $(".celda_p");
  
  if (next == true) {

  } else {
    if $cells
  }
}

function show_model(_valor){
  document.getElementById('bgwindow').style.visibility = _valor;
  //var window = ('bgwindow');
  //window.style.visibility = _valor;
}
