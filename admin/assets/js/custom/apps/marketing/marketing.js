"use strict";
var KTAppEcommerceMarketing = (function () {
    const e = () => {},
        t = () => {};
    return {
        init: function () {
                e(),
                t(),
                (() => {
                    let e;
                    const t = document.getElementById("marketing_form"),
                          o = document.getElementById("marketing_submit");
                    (e = FormValidation.formValidation(t, {
                        fields: { 
                                  default_page_title: { validators: {notEmpty:{message:"Page Title is required"} } },
                                  default_meta_description: { validators: { stringLength: { max: 70, message: "Please enter no more than 70 characters." } } },
                                  
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
                                                    //var formData	= $('#home_page_form').serialize();
                                                    // var meta_description = $(".meta_description").val();
                                                    
                                                    var market_id = $('.market_id').val();
													  if(market_id) {
														 var text_msg = "Markert has been successfully updated!";
													  }
                                                   
													var formData = new FormData($('#marketing_form')[0]);
                                                    formData.append("market", "Y");
                                                    // formData.append("meta_description",meta_description);
                                                                                                                                                                                                             
                                                    $.ajax({
														   type: "POST",
														   url: 'index.php?file=marketing/marketing',
														   //data: 'video_generator='+video_generator+'&home_page=Y&'+formData,
                                                           data: formData,
                                                           processData: false,
														   contentType: false,
														   success: function(response) 
														   {
                                                                alert(response);
                                                                // return false;
                                                            setTimeout(function(){ 
																swal.close();
																window.location = 'index.php?file=marketing/marketing';
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
    KTAppEcommerceMarketing.init();
});

updateCountdown();
$('.default_meta_description').change(updateCountdown);
$('.default_meta_description').keyup(updateCountdown);


function updateCountdown() {
    var remaining = 70 - jQuery('.default_meta_description').val().length;
    if(remaining<0) {
        jQuery('.countdown').hide();
    } else {
        jQuery('.countdown').show();
        jQuery('.countdown').text(remaining + ' characters remaining.');
    }
}