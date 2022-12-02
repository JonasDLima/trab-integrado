// var seta = document.getElementsByClassName("arrow_direita")
// var seta_voltar = document.getElementsByClassName("arrow_esquerda")
var imagens = document.getElementById("imagens");
var isCheck = "#FFFFFF";
var currentFilm = 1;

function selecionado() {
  var img;
  var fundo;
  var subt;
  var desc;
  for (var idx = 1; idx <= 3; idx++) {
    img = document.getElementById("img" + idx);
    fundo = document.getElementById("bl" + idx);
    subt = document.getElementById("subtitulo" + idx);
    // desc = document.getElementById("description" + idx);
    

    fundo.style.background = isCheck;
    img.style.opacity = 0;
    subt.style.opacity = 0;
    // desc.style.opacity = 0;
  }
}

function setImg(idx) {
  selecionado();

  var bl = document.getElementById("bl" + idx);
  var filme = document.getElementById("img" + idx);
  var subt = document.getElementById("subtitulo" + idx);
  // var desc = document.getElementById("description" + idx);

  bl.style.background = "#000";
  filme.style.opacity = 1;
  subt.style.opacity = 1;
  // desc.style.opacity = 1;
  currentFilm = idx;
}

setImg(currentFilm);

document.addEventListener("click", function(event){
    event.preventDefault();
  
    if(event.target.id.indexOf("bl") != -1 ){
      var idx = event.target.id.split("bl")[1];
      setImg(idx);
    }

    if(event.target.className.split("_")[0] == "arrow"){
      var idx = event.target.className.split("arrow_")[1];
  
      if(idx == "direita" && currentFilm != 1){
        currentFilm--;
        setImg(currentFilm);
      }
  
      if(idx == "esquerda" && currentFilm != 3){
        currentFilm++;
        setImg(currentFilm);
      }
    }
  })