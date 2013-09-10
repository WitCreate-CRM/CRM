$(function() {
 $(".datepicker" ).datepicker({ dayNamesMin: [ "Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab" ] });
 var dateFormat = $(".datepicker" ).datepicker( "option", "dateFormat" );
 $(".datepicker" ).datepicker( "option", "dateFormat", "dd-mm-yy" );
 $(".datepicker").datepicker();
});

