$(document)
		.ready(
				function() {
					var example = $('#example')
							.DataTable(
									{
										"processing" : true, // for show
																// progress bar
										"serverSide" : true, // for process
																// server side

										"ajax" : {
											"data" : function() {
												var info = $('#example')
														.DataTable().page
														.info();

												$('#example').DataTable().ajax
														.url("/api/getAllStudent");
												
												
											},
										},
										"columns" : [
												{
													"data" : "id"
												},
												{
													"data" : "name"
												},
												{
													"data" : "email"
												},
												{
													"data" : "dob"
												},
												{
													"data" : "gender"
												},
												{
													"data" : "address"
												},
												{
													"data" : "city"
												},
												{
													"data" : "state"
												},
												{
													"data" : "pincode"
												},
												{
													"data" : "contact_no"
												},
												{
													"data" : "doj"
												},
												{

													"data" : "id",
													"title" : "delete",
													"render" : function(data,
															type, row) {

														return '<a href="/api/delete?id='
																+ data
																+ '">Delete</a>';

														return '<a href="/api/delete?id='
																+ data
																+ '" id=del>Delete</a>';
													}

												} 
												],
										"processing" : true,
										"serverSide" : true,

									});

					$('#example tbody')
							.on(
									'click',
									'tr td #del',
									function() {
										var row = $(this).parents('tr')[0];
										var data = (example.row(row).data());
										var con = confirm("Are you sure you want to delete this profile Id "
												+ data["id"])
										if (con) {
											// Do Something
										} else {
											// Nothing to do here
										}

									});
				});