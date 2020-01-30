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
														.url("/api/getAllSchool");
												
												/*$('#example').DataTable().ajax
												.url("/school/studentPagination/"
														+ (info.page + 1)
														+ "/" + 10);*/
												
											},
										},
										"columns" : [
												{
													"data" : "id"
												},
												{
													"data" : "school_name"
												},
												{
													"data" : "school_email"
												},
												{
													"data" : "google_id"
												},
												{
													"data" : "random_key"
												}
												
												],
										"processing" : true,
										"serverSide" : true,

									});

					
				});