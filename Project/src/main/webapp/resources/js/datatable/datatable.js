$(document).ready(function() {
	$('#example').DataTable({
		"processing": true, // for show progress bar
        "serverSide": true, // for process server side
       
        
		"ajax" :{
   			"data": function(){
		      var info = $('#example').DataTable().page.info();
		
		      $('#example').DataTable().ajax.url(
		    		  "/api/getStudent"
		      );
		      $('#example').DataTable().ajax.url(
		    		  "/api/studentPagination/"+(info.page + 1)+"/"+10
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
		}, {
			"data" : "id",
			"title": "edit",
			"render": function (data, type, row) {
				return '<a href="/school/edit?id=' + data + '">Edit</a>';
			}
		},
		
		{    
            "data": "id",  
            "title": "delete",
            "render": function (data, type, row) {  
                return '<a href="/school/delete?id=' + data + '">Delete</a>';  
            } 
            
            
		}],
		"processing": true,
        "serverSide": true,
       
	});
});