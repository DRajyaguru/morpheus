"use strict";
var SaveProduct = (function () {
    const e = () => {},
        t = () => {};
	var quill;	
    return {
        init: function () {
            var o, a;
            ["#add_product_description"].forEach((e) => {
                let t = document.querySelector(e);
                t && (quill = new Quill(e, { modules: { toolbar: [ [{ header: [1, 2, 3, 4, 5, 6, !1] }], [{ 'header': 1 }, { 'header': 2 }], ['bold', 'italic', 'underline', 'strike'], ["link"], [{ 'list': 'ordered'}, { 'list': 'bullet' }], [{ 'script': 'sub'}, { 'script': 'super' }], ["blockquote", "code-block"], [{ 'color': [] }, { 'background': [] }], [{ 'align': [] }] ] }, placeholder: "Type your text here...", theme: "snow" }));
            }),
                e(),
                t(),
                (() => {
                    let e;
                    const t = document.getElementById("add_product_form"),
                        o = document.getElementById("add_product_submit");
                    (e = FormValidation.formValidation(t, {
                        fields: {
							storyboard_id: { validators: { notEmpty: { message: "Storyboard ID is required." }, remote: {method:'POST', url: 'index.php?file=product/product_add', data: {type: 'storyboard_id_check', product_id: $('.product_id').val()}, message: 'This storyboard id is already exist!'} } },
                            video_name: { validators: { notEmpty: { message: "Video name is required." }, remote: {method:'POST', url: 'index.php?file=product/product_add', data: {type: 'video_name_check', product_id: $('.product_id').val()}, message: 'This video name is already exist!'} } },
                            sku: { validators: { notEmpty: { message: "SKU is required." }, remote: {method:'POST', url: 'index.php?file=product/product_add', data: {type: 'sku_check', product_id: $('.product_id').val()}, message: 'This sku is already exist!'} } },
                            price: { validators: {regexp: {regexp: /^\d{0,5}(\.\d{1,2})?$/, message: 'Max 5 digits allowed with optional 2 decimal digits.'} } },
							credits: { validators: {stringLength: {max: 5, message: "Maximum 5 digits allowed." }, regexp: {regexp: /^[0-9_\ ]+$/, message: 'Please enter digits only.'} } },
							select_category: { validators: { notEmpty: { message: "Please select atleast 1 category." } } },
							clean_url: { validators: { notEmpty: { message: "Clean URL is required." }, stringLength: { min: 5, message: "Minimum 5 characters required." }, regexp: {regexp: /^[a-zA-Z0-9\-]+$/, message: 'Clean URL can only consist of alphanumeric and dash.'}, remote: {method:'POST', url: 'index.php?file=product/product_add', data: {type: 'clean_url_check', product_id: $('.product_id').val()}, message: 'This clean url is already exist!'} } },
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
													  var product_id = $('.product_id').val();
													  if(product_id) {
														 var text_msg = "Product has been successfully updated!";
													  } else {
														  var text_msg = "Product has been successfully added!"  
													  }
													  
													  //var description = $("#add_product_description .ql-editor").html();
													  var description = quill.root.innerHTML.replace(/&nbsp;/gi,"");
													  if($("#add_product_description .ql-editor").hasClass('ql-blank')) {
												   		 description = '';
													  }
													  
													  var formData	= $('#add_product_form').serialize();
													  var extra_fields = new Array();
													  //$('#extra_fields_section input[type=text]').each(function(){
													  $('#extra_fields_section input[type=hidden]').each(function(){	  
														extra_fields.push($(this).attr('name'));
													  })
													  
													  $.ajax({
														   type: "POST",
														   url: 'index.php?file=product/product_add',
														   data: 'add_product=Y&'+formData+'&description='+description+'&extra_fields='+extra_fields,
														   success: function(response) 
														   {
															   //alert(response);
															   //return false;
															   setTimeout(function(){ 
																swal.close();
																window.location = 'index.php?file=product/product_list';
															   }, 1000);
														   }
													  });
                                                      o.removeAttribute("data-kt-indicator"),
                                                          Swal.fire({
                                                              text: text_msg,
                                                              icon: "success",
                                                              buttonsStyling: !1,
                                                              confirmButtonText: "Ok, got it!",
                                                              customClass: { confirmButton: "btn btn-primary" },
                                                          }).then(function (e) {
                                                              e.isConfirmed && ((o.disabled = !1), (window.location = t.getAttribute("data-kt-redirect")));
                                                          });
                                                  }, 2e3))
                                                : Swal.fire({
                                                      html: "Sorry, looks like there are some errors detected, please try again.",
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
    SaveProduct.init();
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
  $("#extra_fields_section .card-body").children().slice(1).remove();
  $('.thumb_size').remove();
  $("#extra_fields_section .card-body .d-flex").removeClass('d-none')
  $.ajax({
	   type: "POST",
	   url: 'index.php?file=product/storyboard_data',
	   data: 'storyboard=Y&storyboard_id='+storyboard_id,
	   dataType: 'json',
	   success: function(response) 
	   {
		   $("#extra_fields_section .card-body .d-flex").addClass('d-none')
		   var video_name = response.name.replace(/_/g, ' ');
		   //response.name.replace(/[\-_]/g, ' ')
		   var video_thumb = response.thumbnail;
		   var video_thumb_size = response.width + ' x ' + response.height;
		   var label_name, placeholder, field_name, hidden_field_name;
		   var getInput = '';
		   var data_length = response.data.length;
		   var mb_class = ' mb-10';
		   var label_name_tag = '';
		   var label_position = '';
		   var flex_basis_100 = '';
		   seo_field_autopopulate(video_name);
		   $("input[name='video_name']").val(video_name);
		   $("input[name='video_img_url']").val(video_thumb);
		   $('.image-input-wrapper').css("background-image", "url("+video_thumb+")");  
		   $('<span class=thumb_size>'+video_thumb_size+'</span>').insertAfter(".image-input");
		   $.each(response.data, function (index, value) {
				label_name = value.key.replace(/_/g, ' ');
				placeholder = label_name;
				field_name = value.key.replace(/\s+/g, '-')
				hidden_field_name = value.key
				if (index === (data_length - 1)) { mb_class=''; }
				if (index === 0) { label_position = '<label class="form-label label-position">Position</label>'; label_name_tag = '<label class="form-label label-name">Label</label>'; flex_basis_100 = ''; } else { label_position = ''; label_name_tag = ''; flex_basis_100 = 'flex-basis-100'; }
				getInput += '<div class="extra_field_input'+mb_class+'"><label class="form-label '+flex_basis_100+'">'+label_name+'</label>'+label_name_tag+label_position+'<input type="hidden" name="'+hidden_field_name+'" /><input type="text" name="'+field_name+'" class="form-control" placeholder="'+placeholder+'" /><input type="text" name="'+field_name+'_Label" class="form-control input-label-name" value="'+label_name+'" placeholder="'+placeholder+' Label" /><input type="text" name="'+field_name+'_Position" class="form-control input-position" value="0" onkeyup=this.value=this.value.replace(/[^0-9]/g,"") maxlength="3" placeholder="Position" /></div>';
            });
		   var extra_fields_input = getInput;
		   $("#extra_fields_section .card-body").append(extra_fields_input);
		   if(video_thumb!='') {
			 $('.image-input').addClass('image-input-changed').removeClass('image-input-empty');  
		   }
	   }
	  });	
});

$('body').on('click', '.btn-remove-icon', function() {
	$('.thumb_size').remove();
});

$(".video_name").focusout(function(){
  var video_name = $(this).val();	
  seo_field_autopopulate(video_name);
});

function seo_field_autopopulate(video_name) {
  var clean_url = video_name.toLowerCase().replace(/\s+/g, '-');
  $('.clean_url').val(clean_url);
  var meta_title = video_name.toLowerCase().replace(/\s+/g, ' ');
  $('.meta_title').val(meta_title);
  $('.meta_title').css('textTransform', 'capitalize');
}

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