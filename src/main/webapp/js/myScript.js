'use strict';


//$(document).ready(function(){
//    $('#loginButton').click(function(){
//    	event.preventDefault();
//        var email = $('#email').val();
//        var password = $('#password').val();
//        $.ajax({
//            type:'POST',
//            dataType:'JSON',
//            data: {
//                email : email,
//                password : password
//            },
//            async:false,
//            url :'LoginServlet',
//            success : function(data){
//            	callbackFn(data);
//            },
//            error: function(jqXHR, textStatus, errorThrown) {
//            	console.log(textStatus);
//            }
//            
//        });
//
//    });
//    
//    function callbackFn (data){
////        alert(data.message);
//        console.log("message" + message);
//        if(message  == 1){
//        	alert("Gusyo la ama")
//            window.location.href = "WelcomeHomePage.jsp"
//        }
//        $('#errorMsg').hide().html("Username or Password Do not Match!").fadeIn('slow');
//    }
//    
//    $('#registerButton').click(function(){
//    	event.preventDefault();
//    	var name = $('#name').val();
//        var email = $('#email').val();
//        var password = $('#password').val();
//        $.ajax({
//            type:'POST',
//            dataType:'JSON',
//            data: {
//            	name : name,
//                email : email,
//                password : password
//            },
//            async:false,
//            url : 'RegistrationServlet',
//            success : function(data){
//            	console.log(data);
//                var message = data.message;
//                console.log("message" + message);
//                if(message == 1){
//                    window.location.href = "WelcomeHomePage.jsp"
//                }
//                $('#errorMsg').hide().html("Error while registration! Please try again").fadeIn('slow');
//            }
//        });
//        
//
//    });
//
//});


$(function() {
	$("input[type='password'][data-eye]").each(function(i) {
		var $this = $(this),
			id = 'eye-password-' + i,
			el = $('#' + id);

		$this.wrap($("<div/>", {
			style: 'position:relative',
			id: id
		}));

		$this.css({
			paddingRight: 60
		});
		$this.after($("<div/>", {
			html: 'Show',
			class: 'btn btn-primary btn-sm',
			id: 'passeye-toggle-'+i,
		}).css({
				position: 'absolute',
				right: 10,
				top: ($this.outerHeight() / 2) - 12,
				padding: '2px 7px',
				fontSize: 12,
				cursor: 'pointer',
		}));

		$this.after($("<input/>", {
			type: 'hidden',
			id: 'passeye-' + i
		}));

		var invalid_feedback = $this.parent().parent().find('.invalid-feedback');

		if(invalid_feedback.length) {
			$this.after(invalid_feedback.clone());
		}

		$this.on("keyup paste", function() {
			$("#passeye-"+i).val($(this).val());
		});
		$("#passeye-toggle-"+i).on("click", function() {
			if($this.hasClass("show")) {
				$this.attr('type', 'password');
				$this.removeClass("show");
				$(this).removeClass("btn-outline-primary");
			}else{
				$this.attr('type', 'text');
				$this.val($("#passeye-"+i).val());
				$this.addClass("show");
				$(this).addClass("btn-outline-primary");
			}
		});
	});

	$(".my-login-validation").submit(function() {
		var form = $(this);
        if (form[0].checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
		form.addClass('was-validated');
	});
});

