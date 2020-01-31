$(document).ready(
		function() {
			var example = $('#example').DataTable(
					{
						"processing" : true, // for show
						// progress bar
						"serverSide" : true, // for process
						// server side

						"ajax" : {
							"data" : function() {
								var info = $('#example').DataTable().page
										.info();

								$('#example').DataTable().ajax
										.url("/api/getAllStudent");

								$('#example').DataTable().ajax
										.url("/school/studentPagination/"
												+ (info.page + 1) + "/" + 10);

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
						"processing" : true,
						"serverSide" : true,

					});

		});