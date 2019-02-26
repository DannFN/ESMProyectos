/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
window.onscroll = function() {stickyheader('sticky-header');};

function filterTable(idInput, iddivError) {
  var input, filter,divtr, divtd, i, j, divError;
  
  input = document.getElementById(idInput);
  filter = input.value.toUpperCase().normalize('NFD').replace(/[\u0300-\u036f]/g, "");
  divtr = document.getElementsByClassName('proyect-content');
  divError = document.getElementById(iddivError);
  j = 0;
  
  for (i = 0; i < divtr.length; i++) {
    divtd = divtr[i].getElementsByClassName('titular')[0];
    
    if (divtd) {
      txtValue = divtd.textContent || divtd.innerText;
      
      if (txtValue.toUpperCase().normalize('NFD').replace(/[\u0300-\u036f]/g, "").indexOf(filter) > -1) {
        divtr[i].style.display = '';
        j ++;
      } else {
        divtr[i].style.display = 'none';
      }
    }
  }
  
  if(j > 0){
    divError.className = divError.className.replace('w3-show', 'w3-hide');
  }else {
    divError.className = divError.className.replace('w3-hide', 'w3-show');
  }
}

function stickyheader (idHeader) {
  var header = document.getElementById(idHeader);
  var sticky = header.offsetTop;
  
  if (window.pageYOffset > sticky) {
    header.classList.add('native-sticky-header');
  } else {
    header.classList.remove('native-sticky-header');
  }
}
