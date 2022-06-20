jQuery(document).ready(function() {
   var baseUrl = '/morpheus/';	
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
   
   jQuery('.modal-body').on('scroll', function() {
     if(jQuery(this).scrollTop() + jQuery(this).innerHeight() >= jQuery(this)[0].scrollHeight - 1) {
      jQuery('.btn-accept-tc:not(.btn-accepted-tc)').removeAttr('disabled')  
     }
   });
   
   jQuery(".click_modal").click(function(e){
	  e.preventDefault(); 
	  setTimeout(function() {
	   if(jQuery('.modal-body').scrollTop() + jQuery('.modal-body').innerHeight() >= jQuery('.modal-body')[0].scrollHeight) {
		 jQuery('.btn-accept-tc:not(.btn-accepted-tc)').removeAttr('disabled');  
	   } else {
		 jQuery('.btn-accept-tc:not(.btn-accepted-tc)').attr("disabled","disabled");   
	   }
	 }, 
	 180);
   });
   
   jQuery(".btn-accept-tc").click(function(){
  	 jQuery(".agree_tick").attr("checked","checked")
	 jQuery(".terms_condition").attr("checked","checked")
	 jQuery(".accept_tc").val("accept_popup");
	 jQuery("#termsconditionModal .btn-close").click();
	 jQuery("#accept_tc-error").remove();
	 setTimeout(function() {
	  jQuery('.btn-accept-tc').text('Already Accepted.');
	  jQuery('.btn-accept-tc').addClass('btn-accepted-tc');
	  jQuery('.btn-accept-tc').attr("disabled","disabled")}, 
	 500);
   });
   
   jQuery("#customer_register_form").validate({
	  ignore: "input[type='text']:hidden", 
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
				   },
		accept_tc: {
            		required:true,
					equals: "accept_popup"
        		   }, 			
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
					 minlength: "Password contain minimum 8 character."
				   },
		confirm_password: {
					required: "Please provide a Confirm Password.",
					minlength: "Password contain minimum 8 character.",
					equalTo: "Both Password should be same."
				  },
		accept_tc: {required: "Please agree to Terms & Conditions."},		  
	  },
	  
	  submitHandler: function (form) { 
            form.submit();
            return false; 
        }
   });
   
    jQuery.validator.addMethod("equals", function(value, element, string) {
		return value === string;
	}, jQuery.validator.format("Please agree to Terms & Conditions."))
   
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
					jQuery(".customer_login_form .customer_profile_row .row").prepend("<div class='col-md-12 login-warning'><div class='alert alert-danger'>You've entered an incorrect username/password combination or your account is not approved by admin.</div></div>");
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
		// phone_no:  {		
		// 			  required: true,
		// 			  phoneUS: true
		// 		   },
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
		// phone_no:  {required: "Phone number is required."},
		address1:  {required: "Address is required."},
		city:  	   {required: "City is required."},
		state:     {required: "State is required."},
		country:   {required: "Country is required."},
		zipcode:   {required: "Zipcode is required.", digits: 'Only Digits allowed.'},
	  },
	  
	  submitHandler: function (form) { 
		// alert(first_name);return false;
            form.submit();
            return false;
        }
   });
   jQuery('.state-text').hide();
   jQuery('.checkout-country').change(function(e){
		e.preventDefault();		
		var country_name = jQuery('.checkout-country').val();
		var state_name = jQuery('.checkout-state').val();
		// alert(state_name)
		if(country_name != 'US'){
			jQuery('.state-text').show();
			jQuery('.checkout-state').hide();
			jQuery('.checkout-state').attr("disabled","disabled");
			jQuery('.state-text').removeAttr("disabled");
		}
		else{
			jQuery('.checkout-state').show();
			jQuery('.state-text').hide();
			jQuery('.state-text').attr("disabled","disabled");
			jQuery('.checkout-state').removeAttr("disabled");
		}
		
	}),
	
	jQuery('.checkout-state').change(function(e){
		e.preventDefault();
		var state_name = jQuery('.checkout-state').val();
		if(state_name == 'KY' || state_name == 'TN'){
			jQuery('#phone_no').addClass("required");
		}else{
			jQuery('#phone_no').removeClass("required error");
			
			jQuery('#phone_no-error').remove();
		}
		
		var inputLicense = jQuery('form').find("input[name=license]");
		if(state_name == 'CA' || state_name == 'HI'){
			if(inputLicense.length == 0){
				jQuery('<div class="form-group"><label for="License">License <span class="required">*</span></label><input type="text" class="form-control license" name="license" id="license" required>').appendTo(".license-div");
			}
		}else{
			jQuery('.license').parent().remove();
		}
	})
	// jQuery.validator.addMethod('stateName',function(state, element){
	// 	return this.optional(element) || state.match(/^A[KY]B[TN]$/).test(state)
	// 	var state = jQuery('.checkout-state').val();
	// 	if(state == 'KY' || state == 'TN'){

	// 	}		
	// }, "Phone Number is required");
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
		//   alert(response);
		  //return false;
		  if(response!='') { 
		    jQuery(".extra_fields_input").each(function(){
			   var input_name = jQuery(this).attr('name');
			   var input_val  = jQuery(this).val();
			   jQuery("<input type=hidden name='"+input_name+"' value='"+input_val+"'>").insertBefore($(".purchase_video .continue_purchase"));
			});
			jQuery("<input type=hidden name=video_url value='"+response+"'>").insertBefore($(".purchase_video .continue_purchase"));
		    var video_img_height = jQuery('.video-img').height();
			var video = jQuery('<video />', {
				 id: 'video',
				 src: response,
				 controls: true,
				 autoplay: true,
				 controlsList: "nodownload",
				 muted: true,
				 height: video_img_height
		    });  
			video.appendTo(jQuery('.morpheus_generate_video'));
			var vimeo_src = jQuery('.vimeo-video .video-img').attr('src');
        	jQuery('.vimeo-video .video-img').attr('src',vimeo_src);
		  	setTimeout(function(){
			  jQuery('video').bind('contextmenu',function() { return false; });	
			  jQuery('.video-overlay').hide();
			  jQuery(".video-play-icon").hide();	
			  jQuery('.product-video').css('height',video_img_height+'px');
			  jQuery('.product-video').addClass('append-video');			  
			  jQuery('.video-img').fadeOut("slow");
			  jQuery('.morpheus_generate_video').fadeIn("slow");
			  jQuery('.terms_condition').removeAttr('disabled');
			  jQuery('.terms_condition').change(function(){
				if(jQuery(this).is(":checked")){
					jQuery('.continue_purchase').removeAttr('disabled');
				}else{
					jQuery('.continue_purchase').attr('disabled','disabled');
				}
			  });
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
		
		jQuery('.video_preview').attr('disabled','disabled');
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
					jQuery('.video_preview').removeAttr('disabled');
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
			alert(response)
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