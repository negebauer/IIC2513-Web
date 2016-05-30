$(function() {
  var $cells = $(".celda_p")
  $("button[name=Back]").on('click', toogle_hidden_cells_back)
  $("button[name=Next]").on('click', toogle_hidden_cells_next)
  // console.log($cells);
})

function toogle_hidden_cells_back(ev) {
  ev.preventDefault()
  toogle_hidden_cells(false)
}

function toogle_hidden_cells_next(ev) {
  ev.preventDefault()
  toogle_hidden_cells(true)
}

function toogle_hidden_cells(next) {
  console.log("Next: " + next ? "True" : "False");
}

// $(function() {
//   var $buttonSend = $('.promo');
//   $buttonSend.on('click', desplegar);
//
//
// });

// function desplegar() {
//   document.getElementsById("bgventana").style.visibility = "visible";
//
// }
