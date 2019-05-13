function showCloseNavBlock(idElement) {
  var x = document.getElementById(idElement);
  if (x.className.indexOf('w3-show') === -1) {
    x.classList.add('w3-show');
  } else { 
    x.classList.remove('w3-show');
  }
}

function showCloseMultipleRows(classElement){
  var i, x;
  x = document.getElementsByClassName(classElement);
  
  for(i = 0; i < x.lenght; i++){
    if (x[i].className.indexOf('w3-hide') !== -1) {
      x[i].classList.add('w3-show');
      console.log(x[i].className.indexOf('w3-hide'));
    } else { 
      x[i].classList.remove('w3-show');
      console.log(x[i].className.indexOf('w3-hide'));
    }
  }
}

function stickyHeader(idStickyHeader) {
  var stickyHeader = document.getElementById(idStickyHeader);
  var sticky = stickyHeader.offsetTop;
  
  if (window.pageYOffset > sticky) {
    stickyHeader.classList.add('native-sticky-header');
  } else {
    stickyHeader.classList.remove('native-sticky-header');
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

function closeModalOutside(evt, idModal) {
  var modal = document.getElementById(idModal);
  
  if (evt.target === modal) {
    modal.style.display = 'none';
  }
}

function openTab(evt, tabName) {
  var i, x, tablinks;
  
  x = document.getElementsByClassName('tab-content');
  
  for (i = 0; i < x.length; i++) {
    x[i].style.display = 'none';
  }
  
  tablinks = document.getElementsByClassName('tablink');
  
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].classList.replace('w3-border-theme-d4', 'w3-border-theme');
    tablinks[i].classList.replace('w3-theme-d2', 'w3-theme');
  }
  
  document.getElementById(tabName).style.display = 'block';
  evt.currentTarget.firstElementChild.classList.replace('w3-theme', 'w3-theme-d2');
  evt.currentTarget.firstElementChild.classList.replace('w3-border-theme', 'w3-border-theme-d4');
}