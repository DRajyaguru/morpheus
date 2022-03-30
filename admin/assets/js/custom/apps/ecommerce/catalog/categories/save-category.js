"use strict";
var KTAppEcommerceSaveCategory = (function () {
    const e = () => {},
        t = () => {};
    return {
        init: function () {
            ["#add_category_description"].forEach((e) => {
                let t = document.querySelector(e);
                t && (t = new Quill(e, { modules: { toolbar: [[{ header: [1, 2, !1] }], ["bold", "italic", "underline"], ["code-block"]] }, placeholder: "Type your text here...", theme: "snow" }));
            }),
                e(),
                t(),
                (() => {
                    let e;
                    const t = document.getElementById("add_category_form"),
                          o = document.getElementById("add_category_submit");
                    (e = FormValidation.formValidation(t, {
                        fields: { category_icon: { validators: { file: { extension: 'jpg,jpeg,png', type: 'image/jpeg,image/png', message: "The selected file is not valid" } } },	
								  category_name: { validators: { notEmpty: { message: "Category name is required" }, regexp: {regexp: /^[a-zA-Z0-9_\ ]+$/, message: 'Category name can only consist of alphanumeric and space.'}, remote: {method:'POST', url: 'index.php?file=category/category_add', data: {type: 'category_name_check', category_id: $('.category_id').val()}, message: 'This category name is already exist!'} } },
								  clean_url: { validators: { notEmpty: { message: "Clean URL is required" }, stringLength: { min: 5, message: "Minimum 5 characters required." }, regexp: {regexp: /^[a-zA-Z0-9\-]+$/, message: 'Clean URL can only consist of alphanumeric and dash.'}, remote: {method:'POST', url: 'index.php?file=category/category_add', data: {type: 'clean_url_check', category_id: $('.category_id').val()}, message: 'This clean url is already exist!'} } },
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
													  var category_id = $('.category_id').val();
													  if(category_id) {
														 var text_msg = "Category has been successfully updated!";
													  } else {
														  var text_msg = "Category has been successfully added!"  
													  }
													  var category_img = document.getElementById('category_icon').files[0];
													  var description = $("#add_category_description .ql-editor").html();
													  //var formData	= $('#add_category_form').serialize();
													  var formData = new FormData($('#add_category_form')[0]);
													  // If you want to add an extra field for the FormData
													  formData.append("add_category", "Y");
													  formData.append("description", description);
													  formData.append("file",category_img);
													  
													  $.ajax({
														   type: "POST",
														   url: 'index.php?file=category/category_add',
														   //data: 'add_category=Y&'+formData+'&description='+description,
														   data: formData,
														   processData: false,
														   contentType: false,
														   success: function(response) 
														   {
															   setTimeout(function(){ 
																swal.close();
																window.location = 'index.php?file=category/category_list';
															   }, 1500);
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
                                                      text: "Sorry, looks like there are some errors detected, please try again.",
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
    KTAppEcommerceSaveCategory.init();
});

$('body').on('click', '.status', function() {	
	if($(this).is(':checked')) {
	   $(this).val('Y');	
    } else {
	   $(this).val('N');
    }
});

$('body').on('click', '.btn-cancel-icon, .btn-change-icon', function() {
	if($('.category_id').val()!='') {
		$('.image-input').removeClass('.image-input-changed').addClass('image-input-empty');
		$('.image-input-wrapper').removeAttr('style');
		$('.img_name').val('');
	}
});

/*$('body').on('click', '.btn-change-icon', function() {
	setInterval(function () {
        if($('.category_id').val()!='') {
		  if($('#image_upload').hasClass('fv-plugins-bootstrap5-row-valid')) {
			 $('.img_name').val('');
		  }
	    }
    },1000);
});*/

$(".category_name").focusout(function(){
  var category_name = $(this).val();	
  var clean_url = category_name.toLowerCase().replace(/\s+/g, '-');
  $('.clean_url').val(clean_url);
  var meta_title = category_name.toLowerCase().replace(/\s+/g, ' ');
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