// var seta = document.getElementsByClassName("arrow_direita")
// var seta_voltar = document.getElementsByClassName("arrow_esquerda")
var imagens = document.getElementById("imagens");
var isCheck = "#FFFFFF";
var currentFilm = 1;

function selecionado() {
  var img;
  for (var idx = 1; idx <= 10; idx++) {
    img = document.getElementById("img" + idx);
    
    img.style.display = 'none';

  }
}

function setImg(idx) {
  selecionado();

  var filme = document.getElementById("img" + idx);


  filme.style.display = 'block';

  currentFilm = idx;
}

setImg(currentFilm);

document.addEventListener("click", function(event){
   

    if(event.target.className.split("_")[0] == "arrow"){
      var idx = event.target.className.split("arrow_")[1];
  
      if(idx == "direita" && currentFilm != 1){
        currentFilm--;
        setImg(currentFilm);
      }
  
      if(idx == "esquerda" && currentFilm != 10){
        currentFilm++;
        setImg(currentFilm);
      }
    }
  })