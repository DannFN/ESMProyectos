/*funciones de proyectos*/

function addCProyect() {
  var var0 = $('#add-conacyt-proyect-number').val();
  var var1 = $('#add-conacyt-proyect-name').val();
  var var2 = $('#add-conacyt-proyect-titular').val();
  
  var successHandler = $('#success-handler');
  var errorHandler = $('#success-handler');

  $.post('AddCProyect', 
  {
    conacyt_proyect_number : var0,
    conacyt_proyect_name : var1,
    conacyt_proyect_titular : var2
  }, 
  function(responseText, statusText) {
    if(statusText === 'success' && responseText !== 'Internal server error') {
      $('#conacyt-proyects-table').append(responseText);
      if(successHandler.className.indexOf('w3-show') === -1){
        successHandler.classList.add('w3-show');
      }
    }else {
      if(errorHandler.className.indexOf('w3-show') === -1){
        errorHandler.classList.add('w3-show');
      }
    }
  });
}
/*TODO addCProyect modal*/

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
  
  var successHandler = $('#success-handler');
  var errorHandler = $('#success-handler');
  
  $.post('EditCProyectDo', 
  {
    conacyt_old_proyect_number : var0,
    conacyt_proyect_number : var1,
    conacyt_proyect_name : var2,
    conacyt_proyect_titular : var3
  }, 
  function(responseText, statusText) {
    if(statusText === 'success' && responseText !== 'Internal server error') {
      if(successHandler.className.indexOf('w3-show') === -1){
        successHandler.classList.add('w3-show');
      }
      
      closeModal('modal3');
        
      $('#' + conacytPar0).text(var1);
      $('#' + conacytPar1).text(var2);
      $('.' + conacytPar2).text(var3);
    }else {
      if(errorHandler.className.indexOf('w3-show') === -1){
        errorHandler.classList.add('w3-show');
      }
    }
  });
}

function deleteCProyect(conacytPar) {
  var con = confirm("¿Estás seguro de que deseas eliminar este registro? Esta acción no se podra deshacer");
  var var0 = $('#' + conacytPar).val();
  
  var successHandler = $('#success-handler');
  var errorHandler = $('#success-handler');
  
  if(con === true) {
    $.post('DeleteCProyect', 
    {
      conacyt_proyect_number : var0
    }, 
    function(responseText, statusText) {
      if(statusText === 'success' && responseText !== 'Internal server error') {
        $('#conacyt-proyects-table').remove();
        if(successHandler.className.indexOf('w3-show') === -1){
          successHandler.classList.add('w3-show');
        }
      }else {
        if(errorHandler.className.indexOf('w3-show') === -1){
          errorHandler.classList.add('w3-show');
        }
      }
    });
  }
}

/*funciones de usuarios*/

function addUser1() {
  var var0 = $('#add-user-real-name').val();
  var var1 = $('#add-user-surname').val();
  var var2 = $('#add-user-username').val();
  var var3 = $('#add-user-access-level').val();
  var var4 = $('#add-user-password').val();
  
  var successHandler = $('#success-handler');
  var errorHandler = $('#success-handler');

  $.post('AddUser', 
  {
    user_real_name : var0,
    user_surname : var1,
    user_username : var2,
    user_access_level : var3,
    user_password : var4
  }, 
  function(responseText, statusText) {
    if(statusText === 'success' && responseText !== 'Internal server error') {
      $('#users-table').append(responseText);
      if(successHandler.className.indexOf('w3-show') === -1){
        successHandler.classList.add('w3-show');
      }
    }else {
      if(errorHandler.className.indexOf('w3-show') === -1){
        errorHandler.classList.add('w3-show');
      }
    }
  });
}