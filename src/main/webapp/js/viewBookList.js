$(document).ready(function(){
	
	$('#confirmButton').click(function(){
		var selectedFile = [];
		$('div input[type=checkbox]').each(function() {
		   if ($(this).is(":checked")) {
			   selectedFile.push($(this).attr('name'));
		   }
		});
		
		 $.ajax({
             type:'POST',
             dataType:'JSON',
             url :'SendEmailServlet',
             data : {selectedFile : JSON.stringify(selectedFile)},
             success : function(data){
     
             },
             error: function(jqXHR, textStatus, errorThrown) {
             	console.log(textStatus);
             },
         });
		
    });

        $.ajax({
            type:'GET',
            dataType:'json',
            url : 'ListFileServlet',
            success : function(data){
                console.log("data - " + data);
                $.each(data.bookList,function(i,obj)
                {
                var tr_data = "<tr> <th scope = 'row'><input type = 'checkbox' class = 'book-checkbox' name ="+ obj.value+ "> <img src='images/book.png' " +
                		"alt='logo' height='20px' width='20px'><td>" +obj.value + "<td><strike><i>4.99$</i></strike><img src='images/buy.jpeg' " +
                		"alt='logo' height='20px' width='20px'></tr>";
                 $(tr_data).appendTo('#book_list'); 
                });  
            },
            complete: function (data) {
            	checkCheckbox(); 
            }
        });      
        checkCheckbox();
        
});


function checkCheckbox () {
	$('input[type=checkbox]').on('change', function (e) {
	    if ($('input[type=checkbox]:checked').length > 12) {
	        $(this).prop('checked', false);
	        alert("Please select at most 12 books");
	    }
	});
}
