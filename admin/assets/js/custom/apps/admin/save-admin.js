"use strict";
var SaveAdmin = (function () {
    const t = document.getElementById("add_admin"),
        e = t.querySelector("#add_admin_form"),
        n = new bootstrap.Modal(t);
		
    return {
        init: function () {
            (() => {
                var o = FormValidation.formValidation(e, {
                    fields: { 
					   first_name: { validators: { notEmpty: { message: "First name is required" }, stringLength: { min: 3, message: "Minimum 3 characters required." } } },
					   last_name: { validators: { notEmpty: { message: "Last name is required" }, stringLength: { min: 3, message: "Minimum 3 characters required." } } },  
					   admin_email: { validators: { notEmpty: { message: "Email ID is required" }, regexp: {regexp: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/, message: 'Please enter valid Email Address'}, remote: {method:'POST', url: 'index.php?file=admin/admin_list', data: function(validator) { return  {type: 'email_exist_check', admin_id: $('.admin_id').val()}; }, message: 'This email is already exist!'} } },
					   admin_password: { validators: { notEmpty: { message: "Password is required" }, stringLength: { min: 8, message: 'Minimum 8 characters required.'	}, identical: { compare: function () { return e.querySelector('[name="admin_c_password"]').value;}, message: 'Password and Confirm Password shoud be same.'}  } },
					   admin_c_password: { validators: { notEmpty: { message: "Password is required" }, identical: { compare: function () { return e.querySelector('[name="admin_password"]').value;}, message: 'Password and Confirm Password shoud be same.'} } } },
                    plugins: { trigger: new FormValidation.plugins.Trigger(), bootstrap: new FormValidation.plugins.Bootstrap5({ rowSelector: ".fv-row", eleInvalidClass: "", eleValidClass: "" }) },
                });
                const i = t.querySelector('[admins-modal-action="submit"]');
                i.addEventListener("click", (t) => {
                    t.preventDefault(),
                        o &&
                            o.validate().then(function (t) {
                                console.log("validated!"),
                                    "Valid" == t
                                        ? (i.setAttribute("data-kt-indicator", "on"),
                                          (i.disabled = !0),
                                          setTimeout(function () {
											  var formData	= $('#add_admin_form').serialize();
											  $.ajax({
												   type: "POST",
												   url: 'index.php?file=admin/admin_list',
												   data: 'add_admin=Y&'+formData,
												   success: function(response) 
												   {
													   setTimeout(function(){ 
													   	swal.close(); n.hide();}, 
													   1500);
													   setTimeout(function(){ 
													    window.location = 'index.php?file=admin/admin_list'; 
													   }, 2000);
												}
											  });
                                              i.removeAttribute("data-kt-indicator"),
                                                  (i.disabled = !1),
                                                  Swal.fire({ text: "Form has been successfully submitted!", icon: "success", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn btn-primary" } }).then(
                                                      function (t) {
                                                          t.isConfirmed && n.hide();
                                                      }
                                                  );
                                          }, 2e3))
                                        : Swal.fire({
                                              text: "Sorry, looks like there are some errors detected, please try again.",
                                              icon: "error",
                                              buttonsStyling: !1,
                                              confirmButtonText: "Ok, got it!",
                                              customClass: { confirmButton: "btn btn-primary" },
                                          });
                            });
                }),
                    t.querySelector('[admins-modal-action="cancel"]').addEventListener("click", (t) => {
                        t.preventDefault(),
                            Swal.fire({
                                text: "Are you sure you would like to cancel?",
                                icon: "warning",
                                showCancelButton: !0,
                                buttonsStyling: !1,
                                confirmButtonText: "Yes, cancel it!",
                                cancelButtonText: "No, return",
                                customClass: { confirmButton: "btn btn-primary", cancelButton: "btn btn-active-light" },
                            }).then(function (t) {
                                t.value
                                    ? (e.reset(), n.hide())
                                    : "cancel" === t.dismiss &&
                                      Swal.fire({ text: "Your form has not been cancelled!.", icon: "error", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn btn-primary" } });
                            });
                    }),
                    t.querySelector('[admins-modal-action="close"]').addEventListener("click", (t) => {
                        t.preventDefault(),
                            Swal.fire({
                                text: "Are you sure you would like to cancel?",
                                icon: "warning",
                                showCancelButton: !0,
                                buttonsStyling: !1,
                                confirmButtonText: "Yes, cancel it!",
                                cancelButtonText: "No, return",
                                customClass: { confirmButton: "btn btn-primary", cancelButton: "btn btn-active-light" },
                            }).then(function (t) {
                                t.value
                                    ? (e.reset(), n.hide())
                                    : "cancel" === t.dismiss &&
                                      Swal.fire({ text: "Your form has not been cancelled!.", icon: "error", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn btn-primary" } });
                            });
                    });
            })();
        },
    };
})();
KTUtil.onDOMContentLoaded(function () {
    SaveAdmin.init();
});