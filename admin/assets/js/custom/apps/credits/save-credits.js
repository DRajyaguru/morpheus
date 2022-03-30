"use strict";
var KTAppEcommerceSaveCredits = (function () {
    const e = () => {},
        t = () => {};
    return {
        init: function () {
            ["#add_credits_description"].forEach((e) => {
                let t = document.querySelector(e);
                t && (t = new Quill(e, { modules: { toolbar: [[{ header: [1, 2, !1] }], ["bold", "italic", "underline"], ["code-block"]] }, placeholder: "Type your text here...", theme: "snow" }));
            }),
                e(),
                t(),
                (() => {
                    let e;
                    const t = document.getElementById("add_credits_form"),
                          o = document.getElementById("add_credits_submit");
                    (e = FormValidation.formValidation(t, {
                        fields: {
                            package_name: { validators: {notEmpty:{message:"Package Name is required"},regexp: {regexp: /^[a-zA-Z0-9_\ ]+$/, message: 'Package Name can only consist of alphanumeric and space.'} } },
                            credits: { validators: {notEmpty:{message:"Credits is required"},regexp: {regexp: /^[0-9_\ ]+$/, message: 'Please Enter Digits only.'} } },
                            amount: { validators: {notEmpty:{message:"Amount is required"},regexp: {regexp: /^\$?[0-9]*[0-9]\.?[0-9]{0,3}$/, message: 'Please Enter Digits only.'} } },
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
                                                var formData	= $('#add_credits_form').serialize();
                                                var description = $("#add_credits_description .ql-editor").html();
                                                var credits_id = $('.credits_id').val();
                                                  if(credits_id) {
                                                     var text_msg = "Credits has been successfully updated!";
                                                  } else {
                                                      var text_msg = "Credits has been successfully added!"  
                                                  }
                                                  
                                                  $.ajax({
                                                       type: "POST",
                                                       url: 'index.php?file=credits/credits_add',
                                                       data: 'description='+description+'&add_credits=Y&'+formData,
                                                       success: function(response) 
                                                       {
                                                        console.log(response)
                                                        setTimeout(function(){ 
                                                            swal.close();
                                                            window.location = 'index.php?file=credits/credits_list';
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
    KTAppEcommerceSaveCredits.init();
});

$('body').on('click', '.status', function() {	
	if($(this).is(':checked')) {
	   $(this).val('Y');	
    } else {
	   $(this).val('N');
    }
});