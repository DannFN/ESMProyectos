document.oncontextmenu=function(){return false;};
document.onselectstart=function(){return false;};

function numYLet(e){
	tecla = (document.all) ? e.keyCode : e.which;
	if (tecla === 8) return true;

	patron = /[0-9A-Za-zñÑÁÉÍÓÚáéíóú]/;
	tec = String.fromCharCode(tecla);
	return patron.test(tec);
}

function let(e){
	tecla = (document.all) ? e.keyCode : e.which;
	if (tecla === 8) return true;

	patron = /[A-Za-zñÑ-áéíóúÁÉÍÓÚ\s]/;
	tec = String.fromCharCode(tecla);
	return patron.test(tec);
}

function numEnt(e){
	tecla = (document.all) ? e.keyCode : e.which;

	patron=/[0-9]/;
	tec=String.fromCharCode(tecla);
	return patron.test(tec);
}
