/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function showCloseNavBlock(idElement) {
  var x = document.getElementById(idElement);
  if (x.className.indexOf('w3-show') === -1) {
    x.className += ' w3-show';
  } else { 
    x.className = x.className.replace(' w3-show', '');
  }
}

function stickyHeader(idStickyHeader, idMainHeader) {
  var mainHeader = document.getElementById(idMainHeader);
  var stickyHeader = document.getElementById(idStickyHeader);
  var sticky = stickyHeader.offsetTop;
  
  if (window.pageYOffset > sticky) {
    stickyHeader.classList.add('native-sticky-header');
    mainHeader.classList.add('w3-hide');
  } else {
    stickyHeader.classList.remove('native-sticky-header');
    mainHeader.classList.remove('w3-hide');
  }
}

function showModal(idModal) {
  var modal = document.getElementById(idModal);
  
  modal.style.display = 'block';
}

function closeModal(idModal) {
  var modal = document.getElementById(idModal);
  
  modal.style.display = 'none';
}

function closeModalOutside(event, idModal) {
  var modal = document.getElementById(idModal);
  
  if (event.target === modal) {
    modal.style.display = "none";
  }
}
