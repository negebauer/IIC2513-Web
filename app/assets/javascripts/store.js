$(function() {
  var $cells = $(".celda_p");
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
  if (next == true) {
    console.log('next');
  } else {
    console.log('previous');
  }
}
