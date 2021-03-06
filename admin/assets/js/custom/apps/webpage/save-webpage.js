"use strict";

var SaveWebpage = (function () {
    const e = () => {},
        t = () => {};
	var quill;	
    return {
        init: function () {
            ["#add_webpage_description"].forEach((e) => {
                let t = document.querySelector(e);
                t && (quill = new Quill(e, { modules: { toolbar: [ [{ header: [1, 2, 3, 4, 5, 6, !1] }], [{ 'header': 1 }, { 'header': 2 }], ['bold', 'italic', 'underline', 'strike'], ["link"], [{ 'list': 'ordered'}, { 'list': 'bullet' }], [{ 'script': 'sub'}, { 'script': 'super' }], ["blockquote", "code-block"], [{ 'color': [] }, { 'background': [] }], [{ 'align': [] }] ] }, placeholder: "Type your text here...", theme: "snow" }));
            }),
                e(),
                t(),
                (() => {
                    let e;
                    const t = document.getElementById("add_webpage_form"),
                          o = document.getElementById("add_webpage_submit");
                    (e = FormValidation.formValidation(t, {
                        fields: { page_title: { validators: {notEmpty:{message:"Page title is required"},regexp: {regexp: /^[a-zA-Z0-9_\ ]+$/, message: 'Page title can only consist of alphanumeric and space.'}, remote: {method:'POST', url: 'index.php?file=webpage/webpage_add', data: {type: 'webpage_name_check', webpage_id: $('.webpage_id').val()}, message: 'This page title is already exist!'} } },	
								  clean_url: { validators: { notEmpty: { message: "Clean URL is required" }, stringLength: { min: 4, message: "Minimum 4 characters required." }, regexp: {regexp: /^[a-zA-Z0-9\-]+$/, message: 'Clean URL can only consist of alphanumeric and dash.'}, remote: {method:'POST', url: 'index.php?file=webpage/webpage_add', data: {type: 'clean_url_check', webpage_id: $('.webpage_id').val()}, message: 'This clean url is already exist!'} } },
								  meta_description: { validators: { stringLength: { max: 70, message: "Please enter no more than 70 characters." } } },
                                  banner_icon: { validators: { file: { extension: 'jpg,jpeg,png', type: 'image/jpeg,image/png', message: "The selected file is not valid" } } }
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
                                                    //var formData	= $('#add_webpage_form').serialize();
                                                    var banner_img = document.getElementById('banner_icon').files[0];
                                                    var description = quill.root.innerHTML.replace(/&nbsp;/gi,"");
													var webpage_id = $('.webpage_id').val();
													if($("#add_webpage_description .ql-editor").hasClass('ql-blank')) {
													  description = '';
													}
													var formData = new FormData($('#add_webpage_form')[0]);
													  // If you want to add an extra field for the FormData
													  formData.append("add_webpage", "Y");
													  formData.append("description", description);
													  formData.append("file",banner_img);
                                                      console.log(banner_img)
                                                      
                                                      /*function htmlDecode(input) {
													  var doc = new DOMParser().parseFromString(input, "text/html");
													  return doc.documentElement.textContent;
													}
													
													description = htmlDecode(description);*/

													  if(webpage_id) {
														 var text_msg = "Webpage has been successfully updated!";
													  } else {
														  var text_msg = "Webpage has been successfully added!"  
													  }
													  
													  $.ajax({
														   type: "POST",
														   url: 'index.php?file=webpage/webpage_add',
														   //data: 'description='+description+'&add_webpage=Y&'+formData,
                                                           data: formData,
                                                           processData: false,
														   contentType: false,
														   success: function(response) 
														   {
                                                                // alert(response);
                                                            setTimeout(function(){ 
																swal.close();
																window.location = 'index.php?file=webpage/webpage_list';
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
    SaveWebpage.init();
});

$('body').on('click', '.status', function() {	
	if($(this).is(':checked')) {
	   $(this).val('Y');	
    } else {
	   $(this).val('N');
    }
});

$(".page_title").focusout(function(){
  var page_title = $(this).val();	
  var clean_url = page_title.toLowerCase().replace(/\s+/g, '-');
  $('.clean_url').val(clean_url);
  var meta_title = page_title.toLowerCase().replace(/\s+/g, ' ');
  $('.meta_title').val(meta_title);
  $('.meta_title').css('textTransform', 'capitalize');
});

$('body').on('click', '.btn-cancel-icon', function() {
	if($('.webpage_id').val()!='') {
		$('.image-input').removeClass('image-input-changed').addClass('image-input-empty');
		$('.image-input-wrapper').removeAttr('style');
		$('.img_name').val('');
	}
});

$('body').on('click', '.btn-change-icon', function() {
	var img_timer = setInterval(function () {
						if($('.webpage_id').val()!='') {
						  if($('#image_upload').hasClass('fv-plugins-bootstrap5-row-valid')) {
							 $('.img_name').val('');
							 clearInterval(img_timer);
						  }
						}
					},1000);

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