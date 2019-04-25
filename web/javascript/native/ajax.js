function addProyect() {
  $('#add-proyect-submit').click(function(event) {
    var variable = $('#proyect-number').val();
    var variable1 = $('#proyect-name').val();
    var variable2 = $('#proyect-titular').val();
    
    $.post('Servlet', 
    {
      parameter : variable,
      parameter1 : variable1,
      parameter2 : variable2
    }, 
    function(responseText, statusText) {
      if(statusText === 'success' && responseText !== 'Internal server error') {
        $('#conacyt-proyects-table').append(responseText);
        /*TODO cambiar propiedades handler de exito*/
      }else {
        /*TODO cambiar propiedades handler de error*/
      }
    });
  });
}