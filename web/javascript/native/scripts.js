function filterProyectsTable(){
  var input;
  var filter;
  var table;
  var searchParameter;
  var tr;
  var i;
  var j;
  var notFoundTr;
  
  input = document.getElementById('searchbox');
  filter = input.value.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '');
  table = document.getElementById('conacyt-proyects-table');
  tr = table.getElementsByTagName('tr');
  notFoundTr = document.getElementsByClassName('not-found-tr');
  
  j = 0;
  
  for (i = 0; i < (tr.length - 4); i++) {
    searchParameter = tr[i].getElementsByTagName('td')[1];
    
    if (searchParameter) {
      txtValue = searchParameter.textContent || searchParameter.innerText;
      if (txtValue.toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g, '').indexOf(filter) > -1) {
        tr[i].style.display = '';
      } else {
        tr[i].style.display = 'none';
        j ++;
      }
    }
  } 
  
  if(j > 0) {
    notFoundTr[0].classList.remove('w3-hide');
  }else {
    notFoundTr[0].classList.add('w3-hide');
  }
}
