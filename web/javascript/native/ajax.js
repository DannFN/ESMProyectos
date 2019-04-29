function addCProyect() {
  var var0 = $('#add-conacyt-proyect-number').val();
  var var1 = $('#add-conacyt-proyect-name').val();
  var var2 = $('#add-conacyt-proyect-titular').val();

  $.get('AddCProyect', 
  {
    conacyt_proyect_number : var0,
    conacyt_proyect_name : var1,
    conacyt_proyect_titular : var2
  }, 
  function(responseText, statusText) {
    if(statusText === 'success' && responseText !== 'Internal server error') {
      $('#conacyt-proyects-table').append(responseText);
      if($('#success-handler').indexOf('w3-show') === -1){
        $('#success-handler').classList.add('w3-show');
      }
    }else {
      if($('#error-handler').indexOf('w3-show') === -1){
        $('#error-handler').classList.add('w3-show');
      }
    }
  });
}

function editCProyectGet(conacytPar) {
  var var0 = $('#' + conacytPar).val();
  
  $.get('EditCProyectGet', 
  {
    conacyt_proyect_number : var0
  }, 
  function(responseText, statusText) {
    if(statusText === 'success' && responseText !== 'Internal server error') {
      $('#conacyt-proyect-edit-container').append(responseText);
    }else {
      $('#conacyt-proyect-edit-container').text("Hubo un problema con el servidor, vuelve a intentarlo más tarde");
    }
  });
}

function editCProyectDo(conacytPar0, conacytPar1, conacytPar2) {
  var var0 = $('#edit-conacyt-proyect-old-number').val();
  var var1 = $('#edit-conacyt-proyect-number').val();
  var var2 = $('#edit-conacyt-proyect-name').val();
  var var3 = $('#edit-conacyt-proyect-titular').val();
  
  $.post('EditCProyectDo', 
  {
    conacyt_old_proyect_number : var0,
    conacyt_proyect_number : var1,
    conacyt_proyect_name : var2,
    conacyt_proyect_titular : var3
  }, 
  function(responseText, statusText) {
    if(statusText === 'success' && responseText !== 'Internal server error') {
      if($('#success-handler').indexOf('w3-show') === -1){
        $('#success-handler').classList.add('w3-show');
      }
      
      closeModal('modal3');
        
      $('#' + conacytPar0).text(var1);
      $('#' + conacytPar1).text(var2);
      $('.' + conacytPar2).text(var3);
    }else {
      if($('#error-handler').indexOf('w3-show') === -1){
        $('#error-handler').classList.add('w3-show');
      }
    }
  });
}

function deleteCProyect(conacytPar) {
  var con = confirm("¿Estás seguro de que deseas eliminar este registro? Esta acción no se podra deshacer");
  var var0 = $('#' + conacytPar).val();
  
  if(con === true) {
    $.post('DeleteCProyect', 
    {
      conacyt_proyect_number : var0
    }, 
    function(responseText, statusText) {
      if(statusText === 'success' && responseText !== 'Internal server error') {
        $('#conacyt-proyects-table').remove();
        if($('#success-handler').indexOf('w3-show') === -1){
          $('#success-handler').classList.add('w3-show');
        }
      }else {
        if($('#error-handler').indexOf('w3-show') === -1){
          $('#error-handler').classList.add('w3-show');
        }
      }
    });
  }
}