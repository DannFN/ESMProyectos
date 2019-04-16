
function filterTable(idInput, classDivError) {
  var input; 
  var filter;
  var container; 
  var name; 
  var titular;
  var i;
  var j;
  var divError;
  
  input = document.getElementById(idInput);
  filter = input.value.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '');
  
  container = document.getElementsByClassName('proyect-container-class');
  divError = document.getElementsByClassName(classDivError);
  
  j = 0;
  
  for (i = 0; i < container.length; i++) {
    name = container[i].getElementsByClassName('proyect-name-class')[0];
    titular = container[i].getElementsByClassName('proyect-titular-class')[0];
    
    if (name || titular) {
      txtValue = name.textContent || name.innerText;
      txtValue1 = titular.textContent || name.innerText;
      
      if ((txtValue.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '').indexOf(filter) > -1) || (txtValue1.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '').indexOf(filter) > -1)) {
        container[i].style.display = '';
        j ++;
      } else {
        container[i].style.display = 'none';
      }
    }
  }
  
  if(j > 0){
    for(i = 0; i < divError.length; i++){
     divError[i].className = divError[i].className.replace('w3-show', 'w3-hide'); 
    }
  }else {
    for(i = 0; i < divError.length; i++){
     divError[i].className = divError[i].className.replace('w3-hide', 'w3-show');
    }
  }
}
