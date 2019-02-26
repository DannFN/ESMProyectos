/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
	$('#id_botón_acción').click(function(event) {
		//variables por id
		var variable = $('#id_a_obtener').val();
		$.post('Servlet', {
			//Parametros
			parametro : variable, //variable_asociada_al_parametro
   parametro1 : variable //variable_asociada_al_parametro1
		}, function(responseText, statusText) {
			$('#id_elemento_a_alterar').html(responseText||statusText);
		});
	});
});
