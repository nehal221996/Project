$(document).ready(function() {
	console.log("even")
	var std_id = GetURLParameter("id");
	$('#std_id').val(std_id);

	$.ajax({
		url : "editStudent_info?schoolId="+std_id,
		success : function(result) {
			$('#schoolId').val(result.schoolId);
			$('#std_name').val(result.std_name);
			$('#dob').val(result.dob);
			$('#gender').val(result.gender);
			$('#std_email').val(result.std_email);
			$('#address').val(result.address);
			$('#city').val(result.city);
			$('#state').val(result.state);
			$('#pincode').val(result.pincode);
			$('#contact_no').val(result.contact_no);
			$('#doj').val(result.doj);
			$('#password').val(result.password);

		}

	});
});

function GetURLParameter(sParam) {

	var sPageURL = window.location.search.substring(1);
	var sURLVariables = sPageURL.split('&');
	for (var i = 0; i < sURLVariables.length; i++) {
		var sParameterName = sURLVariables[i].split('=');
		if (sParameterName[0] == sParam) {
			return sParameterName[1];
		}

	}

}