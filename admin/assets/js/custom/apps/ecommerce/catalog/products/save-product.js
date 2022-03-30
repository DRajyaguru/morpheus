"use strict";
var KTAppEcommerceSaveProduct = (function () {
    const e = () => {},
        t = () => {};
    return {
        init: function () {
            var o, a;
            ["#add_product_description"].forEach((e) => {
                let t = document.querySelector(e);
                t && (t = new Quill(e, { modules: { toolbar: [[{ header: [1, 2, !1] }], ["bold", "italic", "underline"], ["code-block"]] }, placeholder: "Type your text here...", theme: "snow" }));
            }),
                e(),
                t(),
                (() => {
                    let e;
                    const t = document.getElementById("add_product_form"),
                        o = document.getElementById("add_product_submit");
                    (e = FormValidation.formValidation(t, {
                        fields: {
							product_img: { validators: { file: { extension: 'jpg,jpeg,png', type: 'image/jpeg,image/png', message: "The selected file is not valid" } } },
							storyboard_id: { validators: { notEmpty: { message: "Storyboard ID is required" } } },
                            video_name: { validators: { notEmpty: { message: "Video name is required" } } },
                            sku: { validators: { notEmpty: { message: "SKU is required" } } },
							clean_url: { validators: { notEmpty: { message: "Clean URL is required" }, stringLength: { min: 5, message: "Minimum 5 characters required." }, regexp: {regexp: /^[a-zA-Z0-9\-]+$/, message: 'Clean URL can only consist of alphanumeric and dash.'} } },
                        	meta_description: { validators: { stringLength: { max: 70, message: "Please enter no more than 70 characters." } } } 
						},
                        plugins: { trigger: new FormValidation.plugins.Trigger(), bootstrap: new FormValidation.plugins.Bootstrap5({ rowSelector: ".fv-row", eleInvalidClass: "", eleValidClass: "" }) },
                    })),
                        o.addEventListener("click", (a) => {
                            a.preventDefault(),
                                e &&
                                    e.validate().then(function (e) {
                                        console.log("validated!"),
                                            "Valid" == e
                                                ? (o.setAttribute("data-kt-indicator", "on"),
                                                  (o.disabled = !0),
                                                  setTimeout(function () {
													  var product_img = document.getElementById('product_img').files[0];
													  var description = $("#add_product_description .ql-editor").html();
													  //var formData	= $('#add_category_form').serialize();
													  var formData = new FormData($('#add_product_form')[0]);
													  // If you want to add an extra field for the FormData
													  formData.append("add_product", "Y");
													  formData.append("description", description);
													  formData.append("file",product_img);
													  var extra_fields_name = new Array();
													  $('#extra_fields_section input[type=text]').each(function(){
														extra_fields_name.push($(this).attr('name'));
													  })
													  formData.append("extra_fields_name",extra_fields_name);
													  
													  $.ajax({
														   type: "POST",
														   url: 'index.php?file=product/product_add',
														   //data: 'add_category=Y&'+formData+'&description='+description,
														   data: formData,
														   processData: false,
														   contentType: false,
														   success: function(response) 
														   {
															   alert(response);
															   return false;
															   setTimeout(function(){ 
																swal.close();
																window.location = 'index.php?file=category/category_list';
															   }, 1500);
														   }
													  });
                                                      o.removeAttribute("data-kt-indicator"),
                                                          Swal.fire({
                                                              text: "Form has been successfully submitted!",
                                                              icon: "success",
                                                              buttonsStyling: !1,
                                                              confirmButtonText: "Ok, got it!",
                                                              customClass: { confirmButton: "btn btn-primary" },
                                                          }).then(function (e) {
                                                              e.isConfirmed && ((o.disabled = !1), (window.location = t.getAttribute("data-kt-redirect")));
                                                          });
                                                  }, 2e3))
                                                : Swal.fire({
                                                      html:
                                                          "Sorry, looks like there are some errors detected, please try again.",
                                                      icon: "error",
                                                      buttonsStyling: !1,
                                                      confirmButtonText: "Ok, got it!",
                                                      customClass: { confirmButton: "btn btn-primary" },
                                                  });
                                    });
                        });
                })();
        },
    };
})();
KTUtil.onDOMContentLoaded(function () {
    KTAppEcommerceSaveProduct.init();
});

$('body').on('click', '.status', function() {	
	if($(this).is(':checked')) {
	   $(this).val('Y');	
    } else {
	   $(this).val('N');
    }
});

$(".storyboard_id").blur(function(){
  var storyboard_id = $(this).val();
  $('#extra_fields_section').remove();
  $('.thumb_size').remove();	
  $.ajax({
	   type: "POST",
	   url: 'index.php?file=product/storyboard_data',
	   data: 'storyboard=Y&storyboard_id='+storyboard_id,
	   dataType: 'json',
	   success: function(response) 
	   {
		   var video_name = response.name.replace(/_/g, ' ');
		   var video_thumb = response.thumbnail;
		   var video_thumb_size = response.width + ' x ' + response.height;
		   var label_name, placeholder;
		   var getInput = '';
		   var data_length = response.data.length;
		   var mb_class = 'class=mb-10';
		   $("input[name='video_name']").val(video_name);
		   $('.image-input-wrapper').css("background-image", "url("+video_thumb+")");  
		   $('<span class=thumb_size>'+video_thumb_size+'</span>').insertAfter(".image-input");
		   $.each(response.data, function (index, value) {
				label_name = value.key.replace(/_/g, ' ');
				placeholder = label_name;
				if (index === (data_length - 1)) { mb_class=''; }
				getInput += '<div '+mb_class+'><label class="form-label">'+label_name+'</label><input type="text" name='+value.key+' class="form-control mb-2" value="" placeholder="'+placeholder+'" /></div>';
            });
		   var extra_fields_section = '<div class="card card-flush py-4" id="extra_fields_section"><div class="card-header"><div class="card-title"><h2>Extra Fields</h2></div></div><div class="card-body pt-0">'+getInput+'</div></div>';
		   $(extra_fields_section).insertAfter("#general_section");
		   if(video_thumb!='') {
			 $('.image-input').addClass('.image-input-changed').removeClass('image-input-empty');  
		   }
	   }
	  });	
});

$('body').on('click', '.btn-remove-icon', function() {
	$('.thumb_size').remove();
});

$(".video_name").focusout(function(){
  var video_name = $(this).val();	
  var clean_url = video_name.toLowerCase().replace(/\s+/g, '-');
  $('.clean_url').val(clean_url);
  var meta_title = video_name.toLowerCase().replace(/\s+/g, ' ');
  $('.meta_title').val(meta_title);
  $('.meta_title').css('textTransform', 'capitalize');
});

updateCountdown();
$('.meta_description').change(updateCountdown);
$('.meta_description').keyup(updateCountdown);

function updateCountdown() {
    var remaining = 70 - jQuery('.meta_description').val().length;
	if(remaining<0) {
		jQuery('.countdown').hide();
	} else {
		jQuery('.countdown').show();
    	jQuery('.countdown').text(remaining + ' characters remaining.');
	}
}