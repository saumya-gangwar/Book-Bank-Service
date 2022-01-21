$('#fileup').change(function(){
    //here we take the file extension and set an array of valid extensions
    
    //if file is not valid we show the error icon, the red alert, and hide the submit button
    var files = $(this)[0].files;
    $( ".imgupload" ).hide("slow");
    $( ".imgupload.stop" ).hide("slow");
    $( ".imgupload.ok" ).show("slow");
    
    $( "#submitbtn" ).show();
    $( "#fakebtn" ).hide();
    $('#namefile').css({"color":"green","font-weight":700});
    $('#namefile').html(+files.length+ " Books selected!!!");
        }
    );


//$('#submitbtn').click(function(){
//	var fd = new FormData();
//	fd.append("fileup", $("#fileup")[0].files)
//    $.ajax({
//        type:'POST',
//        data:fd,
//        async:false,
//        processData: false,
//        contentType: false,
//        url : 'UploadFileServlet',
//        success : function(data){
//        	$('#myForm').on('submit', function(e){
//        		  $('#successModal').modal('show');
//        		  e.preventDefault();
//        		});
//        }
//    });
//});
