//Mostrar formulario de búsqueda de registros

$(document).ready(function(){
    $(".busq_reg_oculto").hide();
    $(".most_busq_reg").show();
$('.most_busq_reg').click(function(){
$(".busq_reg_oculto").toggle();
});
});
    



//Mostrar formulario de búsqueda entre rangos de fecha
$(document).ready(function(){
    $(".busq_fech_oculto").hide();
    $(".most_busq_fech").show();
$('.most_busq_fech').click(function(){
$(".busq_fech_oculto").toggle();
});
});