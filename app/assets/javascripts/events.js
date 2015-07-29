// $(function(){
// 	$(".begin").hide();
// });

// $(function() {
// 	$(".dropdown").change(function(){
// 		$(".begin").show();
// 		// $(".logo").hide();
// 	});
// });

$( document ).ready(function() {
	$('#event_name').change(function() { 
		this.form.submit();
	});
});