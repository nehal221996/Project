$(document).ready(function() {
$("#btnAddkey").click(function(){ 
	
	
$.ajax({
url: "studentRandom_key",
type: "post",

success : function(result){
	 
	 var random_key=JSON.toString(result).uniqueID;
	
}

});
});
});