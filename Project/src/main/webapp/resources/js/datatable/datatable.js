$(document).ready(function() {
	$('#example').DataTable({
		
        
		"ajax" :{
   			"data": function(){
		      var info = $('#example').DataTable().page.info();
		
		      $('#example').DataTable().ajax.url(
		    		  "/api/getStudent"
		      );
		   },
    	},
		"columns" : [ {
			"data" : "id"
		}, {
			"data" : "name"
		}, {
			"data" : "email"
		}, {
			"data" : "dob"
		}, {
			"data" : "gender"
		}, {
			"data" : "address"
		}, {
			"data" : "city"
		}, {
			"data" : "state"
		}, {
			"data" : "pincode"
		}, {
			"data" : "contact_no"
		}, {
			"data" : "doj"
		} ],
		
		
	});
});