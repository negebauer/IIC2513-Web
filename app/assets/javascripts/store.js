$(function() {
  $("button[name=Previous]").on('click', toogle_hidden_cells_previous);
  $("button[name=Next]").on('click', toogle_hidden_cells_next);
  $('.celda_p').css('cursor', 'pointer').click(function(){ show_model("visible");});
  $('.cerrar').css('cursor', 'pointer').click(function(){ show_model("hidden");});
})

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

function show_model(_valor) {
  document.getElementById('bgwindow').style.visibility = _valor;
}
