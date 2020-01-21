$(document).ready(function() {
    $('#example').DataTable( {
        "ajax": "data/objects.txt",
        "columns": [
            { "data": "id" },
            { "data": "name" },
            { "data": "email" },
            { "data": "dob" },
            { "data": "gender" },
            { "data": "address" },
            { "data": "city" },
            { "data": "state" },
            { "data": "pincode" },
            { "data": "contact_no" },
            { "data": "doj" }
        ]
    } );
} );