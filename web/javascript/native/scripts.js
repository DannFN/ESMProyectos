/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function filterTable(idInput, idTable, idDivError) {
  var input, filter, table, tr, td, i, j, divError;
  
  input = document.getElementById(idInput);
  filter = input.value.toUpperCase().normalize('NFD').replace(/[\u0300-\u036f]/g, "");
  table = document.getElementById(idTable);
  tr = table.getElementsByTagName("tr");
  divError = document.getElementById(idDivError);
  j = 0;
  
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().normalize('NFD').replace(/[\u0300-\u036f]/g, "").indexOf(filter) > -1) {
        tr[i].style.display = "";
        j++;
      } else {
        tr[i].style.display = "none";
      }
    }
  }
  
  if(j > 0){
    divError.className = divError.className.replace('w3-show', 'w3-hide');
  }else {
    divError.className = divError.className.replace('w3-hide', 'w3-show');
  }
}