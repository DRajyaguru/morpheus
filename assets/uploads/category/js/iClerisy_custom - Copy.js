jQuery(document).ready(function() {
   var baseUrl = '/morpheus_latest/';	
   var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
   var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  	 return new bootstrap.Tooltip(tooltipTriggerEl)
   })	
   jQuery(".myvideos").on("mouseover", function(event) {
    this.play();

  }).on('mouseout', function(event) {
    this.pause();
  });
  
  jQuery("#newsletter_form").submit(function(event) {
      event.preventDefault();
	  var email = jQuery('.email_id').val();
	  var action_url = jQuery('#newsletter_form').attr('action');
	  jQuery('.footer-newsletter span').remove();
	  if(IsEmail(email)==false){
		 jQuery('<span class="error">Not a valid email address!</span>').appendTo('.footer-newsletter').fadeOut(5000);
		 return false;
	  }
	  
	  jQuery.ajax({
		type: "POST",
		url: action_url,
		dataType : 'json',
		data: "newsletter_add=Y&email="+email, 
		success: function(response)
		{ 
		  jQuery('<span class='+response.class+'>'+response.message+'</span>').appendTo('.footer-newsletter').fadeOut(5000);
		  if(response.class=='success') {
			 jQuery('#newsletter_form')[0].reset();  
		  }
	   }
	  });
   });
   
   function IsEmail(email) {
	 var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	 if(!regex.test(email)) {
		return false;
	 }else{
		return true;
	 }
   }
   
   jQuery(".show_password").click(function(e) {
	   e.preventDefault();
	   var passInput = jQuery(this).parent().find('.form-control');
	   if(passInput.attr('type')==='password')
       {
		 jQuery(".show_password").find('.bi').addClass('bi-eye').removeClass('bi-eye-slash')   
         passInput.attr('type','text');
       }else{
		 jQuery(".show_password").find('.bi').addClass('bi-eye-slash').removeClass('bi-eye')  
         passInput.attr('type','password');
      }
   });
   
   jQuery("#customer_register_form").validate({
	  rules: {
		first_name:{
					  required: true,
					  noSpace: true,
					  lettersonly: true
				   },
		last_name: {
					  required: true,
					  noSpace: true,
					  lettersonly: true
				   },
		email_id:  {
					  required: true,
					  email: true,
					  emailExt:true,
					  remote: {
						  method:'POST', 
						  url: 'index.php?file=customer/registration', 
						  data: {type: 'customer_email_check'}
					 }
				   },
		password:  {
					  required: true,
					  minlength: 8,
					  noSpace: true
				   },
		confirm_password: {
					required: true,
					minlength: 8,
					equalTo: "#password"
				   }		  
	  },
	  messages: {
		first_name:{required: "Firstname is required."},
		last_name: {required: "Lastname is required."},
		email_id:  {
					 required: "Please enter an Email Address.",
					 email: "Please enter a valid Email Address.",
					 remote: "Email already in use!"
				   },
		password:  {
					 required: "Please provide a Password.",
					 minlength: "Password contains minimum 8 character."
				   },
		confirm_password: {
					required: "Please provide a Confirm Password.",
					minlength: "Password contains minimum 8 character.",
					equalTo: "Both Password should be same."
				  }
	  },
	  
	  submitHandler: function (form) { 
            form.submit();
            return false; 
        }
   });
   
   jQuery("#customer_login_form").validate({
	  rules: {
		email_id:     {
					  required: true,
					  email: true,
					  emailExt:true,
					  remote: {
						  method:'POST', 
						  url: 'index.php?file=customer/login', 
						  data: {type: 'customer_email_check'}
					 }
				   },
		password:  {
					  required: true,
					  noSpace: true
				   }
	  },
	  messages: {
		email_id:     {
					 required: "Please enter an Email Address.",
					 email: "Please enter a valid Email Address.",
					 remote: "Email is not available!"
				   },
		password:  {
					 required: "Please provide a Password."
				   }
	  },
	  submitHandler: function (form) { 
	        jQuery("div.login-warning").remove();
            jQuery.ajax({
				url: jQuery(form).attr('action'), 
				type: "POST",             
				data: "login_check=Y&"+jQuery(form).serialize(),
				success: function(response) {
				  if(response==0){
					jQuery(".customer_login_form .customer_profile_row .row").prepend("<div class='col-md-12 login-warning'><div class='alert alert-danger'>You've entered an incorrect username/password combination.</div></div>");
				  } else {
					window.location.href = response;
				  }
				}
			});
            return false;
        }
   });
   
   jQuery("#checkout_form").validate({
	  rules: {
		first_name:{
					  required: true,
					  noSpace: true,
					  lettersonly: true
				   },
		last_name: {
					  required: true,
					  noSpace: true,
					  lettersonly: true
				   },
		phone_no:  {		
					  required: true,
					  phoneUS: true
				   },
		address1:  {
					  required: true,
				   },
		city:  	   {
					  required: true,
					  lettersonly: true
				   },
		state:     {
					  required: true,
					  lettersonly: true
				   },
		country:   {
					  required: true,
					  lettersonly: true
				   },
		zipcode:   {
					  required: true,
					  noSpace: true,
					  digits: true
				   },
	  },
	  messages: {
		first_name:{required: "Firstname is required."},
		last_name: {required: "Lastname is required."},
		phone_no:  {required: "Phone number is required."},
		address1:  {required: "Address is required."},
		city:  	   {required: "City is required."},
		state:     {required: "State is required."},
		country:   {required: "Country is required."},
		zipcode:   {required: "Zipcode is required.", digits: 'Only Digits allowed.'},
	  },
	  
	  submitHandler: function (form) { 
	  	    alert(1);
			return false;
            form.submit();
            return false; 
        }
   });
   
   jQuery.validator.addMethod("noSpace", function(value, element)   { //Code used for blank space Validation 
       return this.optional( element ) || /^\S+$/i.test( value );
    }, "No white space allowed.");
   
    jQuery.validator.addMethod("lettersonly", function( value, element ) {
	   return this.optional( element ) || /^[a-zA-Z\s]+$/i.test( value );
	}, "Only Letters allowed." );	 
   
   jQuery.validator.addMethod("emailExt", function(value, element, param) {
      return value.match(/^[a-zA-Z0-9_\.%\+\-]+@[a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,}$/);
   }, "Please enter a valid Email Address");
   
   jQuery.validator.addMethod( "phoneUS", function( phone_number, element ) {
	  phone_number = phone_number.replace( /\s+/g, "" );
		return this.optional( element ) || phone_number.length > 9 &&
		phone_number.match( /^(\+?1-?)?(\([2-9]([02-9]\d|1[02-9])\)|[2-9]([02-9]\d|1[02-9]))-?[2-9]\d{2}-?\d{4}$/ );
	}, "Please enter a valid US Phone number" );
   
   jQuery("#generate_video_form").submit(function(e) {
	 e.preventDefault();
	 jQuery('.morpheus_generate_video').hide(); 
	 jQuery('.morpheus_generate_video video').remove();
	 jQuery(".video-play-icon").show();
	 jQuery('.video-img').removeAttr('style');	
	 jQuery('.product-video').removeClass('append-video');
	 var form = jQuery(this);
	 var actionUrl = window.location.origin + baseUrl + form.attr('action');
	 jQuery('.video-overlay').show();
	 jQuery("html, body").animate({ scrollTop: 0 }, "fast");
	 
	 jQuery.ajax({
		type: "POST",
		url: actionUrl,
		data: "video_generate=Y&"+form.serialize(), 
		success: function(response)
		{ 
		  //alert(response);
		  //return false;
		  if(response!='') { 
		    var video_img_height = jQuery('.video-img').height();
			var video = jQuery('<video />', {
				 id: 'video',
				 src: response,
				 controls: true,
				 autoplay: true,
				 muted: true,
				 height: video_img_height
		    });  
			video.appendTo(jQuery('.morpheus_generate_video'));
		  	setTimeout(function(){
			  jQuery('.video-overlay').hide();
			  jQuery(".video-play-icon").hide();	
			  jQuery('.product-video').css('height',video_img_height+'px');
			  jQuery('.product-video').addClass('append-video')			  
			  jQuery('.video-img').fadeOut("slow");
			  jQuery('.morpheus_generate_video').fadeIn("slow");
			  jQuery('.continue_purchase').removeAttr('disabled')
			}, 3000); 
		     
		  } else {
			  jQuery('.video-overlay').hide();   
			  jQuery('.video-img').show();
			  jQuery('.product-video').removeClass('append-video');
			  jQuery('.continue_purchase').attr('disabled','disabled');
		  }
		  jQuery('#generate_video_form')[0].reset();
		  jQuery('.bg_layer').val('');
		  jQuery(".preview_img").each(function() {
		    jQuery(this).empty(); 
		    var img_name = jQuery(this).next('.col-md-4').find('.bg_layer').attr('name');
			img_name = img_name.replace(/-/g, ' ');
		    jQuery(this).append('<span class=logo_place>'+img_name+'</span>')
	     });
	   }
	 });
   });
   
   /*jQuery('.continue_purchase').click(function() {
     window.location.href = window.location.origin + baseUrl + 'index.php?file=credit/credit_purchase';
     return false;
   });*/
   
   jQuery(".video_quality li").click(function(e) {
  	 jQuery(".video_quality li").removeClass('active');
	 jQuery(this).addClass('active');
	 jQuery('.video_quality li input[name=SelectResolution]').removeAttr('checked');
	 jQuery(this).find('input[name=SelectResolution]').attr('checked','checked')
   });
   
   
   if(jQuery('.register_session').val()!=='') {
        jQuery("#registerNotify").toast({
            delay: 3500
        }); 
      	jQuery("#registerNotify").toast("show");
   }
   
   if(jQuery('.login_session').val()!=='') {
        jQuery("#loginNotify").toast({
            delay: 2500
        }); 
      	jQuery("#loginNotify").toast("show");
   }
   
   jQuery(".upload_file").change(function() {
		var img_name  = jQuery(this).next('.bg_layer').attr('name');
		var img_id    = '#'+jQuery(this).next('.bg_layer').attr('name');
		var img_class = '.preview_img.'+jQuery(this).next('.bg_layer').attr('name');
		
		jQuery('input[type="submit"]').attr('disabled','disabled');
		jQuery(img_class).empty();
		jQuery('.file_warning_msg').remove();
		var formData = new FormData(jQuery('#generate_video_form')[0]);
		var files = jQuery(img_id)[0].files;
		var formUrl = window.location.origin+baseUrl+'index.php?file=product/product';
		if(files.length > 0 ){
		   formData.append('file',files[0]);
		   formData.append('img_upload','Y');
		   jQuery.ajax({
			  url: formUrl,
			  type: 'post',
			  data: formData,
			  contentType: false,
			  processData: false,
			  success: function(response){
				 if(response != 0){
					jQuery('input[name='+img_name+']').val(response);
					jQuery('input[type="submit"]').removeAttr('disabled');
					jQuery(img_class).append('<img src='+response+' />');
				 } else{
					jQuery(img_class).append('<span class=logo_place>'+img_name+'</span><span class=file_warning_msg>Please select valid file.</span>');
					jQuery('.file_warning_msg').fadeIn('slow', function () {
					  jQuery(this).delay(2500).fadeOut('slow');
				    });
				 }
			  },
		   });
		}else{
		   jQuery(img_class).append('<span class=logo_place>'+img_name+'</span><span class=file_warning_msg>Please select a file.</span>');
		   jQuery('.file_warning_msg').fadeIn('slow', function () {
			 jQuery(this).delay(2500).fadeOut('slow');
		   });
		}
	});
	
	jQuery(".remove_credits").click(function(e) {
	  e.preventDefault();
	  jQuery('h4.final_total').removeClass('bg-effect');
	  var customer_id = jQuery('.customer_id').val();
	  var credits_item = jQuery(this).attr('id');
	  var credits_item_id = '#'+credits_item;
	  var checkoutUrl = 'index.php?file=purchase/checkout';
	  jQuery.ajax({
		type: "POST",
		url: checkoutUrl,
		data: "action=remove&customer_id="+customer_id+"&credits_item="+credits_item, 
		success: function(response)
		{ 
		  jQuery('h4.final_total').addClass('bg-effect');
		  var final_total = jQuery(".credit_total_amount").text().replace(/,/g, "");
		  var delete_credit_amt = jQuery(credits_item_id).parent().siblings().find(".credit_amount").text().replace(/,/g, "")
		  var final_price = final_total - delete_credit_amt;
		  jQuery('.credit_total_amount').text(final_price.toFixed(2))
		  jQuery(credits_item_id).closest(".col-lg-12").remove();
		  if(jQuery('.remove_credits').length == 1){
			 jQuery('.remove_credits').remove(); 
		  }
		}
	  });
	});
	
	/*jQuery(".remove_items").click(function(e) {
	  e.preventDefault();
	  var customer_id = jQuery('.customer_id').val();
	  var storyboard = jQuery(this).attr('id');
	  var storyboard_id = '#'+storyboard;
	  var cartUrl = 'index.php?file=purchase/cart';
	  jQuery.ajax({
		type: "POST",
		url: cartUrl,
		data: "action=remove&customer_id="+customer_id+"&storyboard_id="+storyboard, 
		dataType: 'JSON',
		success: function(response)
		{ 
		  var total_element = response[0].total_element;
		  var total_credits = response[0].total_credits;
		  jQuery('.count-item').text(total_element);
		  jQuery('.total-buy-credits').text(total_credits);
		  jQuery(storyboard_id).closest(".cart-video-info").remove();
		}
	  });
	});*/
});