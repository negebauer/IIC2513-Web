$(function() {
  var $cells = $(".celda_p");
  $("button[name=Previous]").on('click', toogle_hidden_cells_back);
  $("button[name=Next]").on('click', toogle_hidden_cells_next);
  // console.log($cells);
})

function toogle_hidden_cells_back(ev) {
  ev.preventDefault();
  toogle_hidden_cells(false);
}

function toogle_hidden_cells_next(ev) {
  ev.preventDefault();
  toogle_hidden_cells(true);
}

function toogle_hidden_cells(next) {
  if next {
    console.log('next');
  } else {
    console.log('back');
  }
}
