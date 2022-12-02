// Pega o elemento
var modal = document.getElementById('simpleModal');
// Pega o o botão que abre o modal
var modalBtn = document.querySelectorAll('.openModal');
// Pega o o botão que fecha o modal
var closeBtn = document.getElementsByClassName('closeBtn')[0];

// Ouve o botao de abrir
for(i=0;i<modalBtn.length;i++) {
    modalBtn[i].addEventListener('click', openModal);
}
// Ouve o botao de fechar
closeBtn.addEventListener('click', closeModal);
// Ouve o clique fora do campo
window.addEventListener('click', outsideClick);

// Abre
function openModal(){
  modal.style.display = 'block';
}

// Fecha
function closeModal(){
  modal.style.display = 'none';
}

// Clica Fora e fecha
function outsideClick(e){
  if(e.target == modal){
    modal.style.display = 'none';
  }
}