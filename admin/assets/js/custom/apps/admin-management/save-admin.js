"use strict";
var KTAdminsAddAdmin = (function () {
    const t = document.getElementById("kt_modal_add_admin"),
        e = t.querySelector("#kt_modal_add_admin_form"),
        n = new bootstrap.Modal(t);
		
    return {
        init: function () {
            (() => {
                var o = FormValidation.formValidation(e, {
                    fields: { 
					   first_name: { validators: { notEmpty: { message: "First name is required" }, stringLength: { min: 3, message: "Minimum 3 characters required." } } },
					   last_name: { validators: { notEmpty: { message: "Last name is required" }, stringLength: { min: 3, message: "Minimum 3 characters required." } } },  
					   admin_email: { validators: {notEmpty:{message:"Valid email address is required"},regexp: {regexp: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/, message: 'Please Enter valid Email Address'}, remote: {method:'POST', url: 'index.php?file=admin/admin_list', data: {type: 'email_exist_check', customer_id: $('.admin_id').val()}, message: 'This Email is already exist!'} } },					 
					   //admin_email: { validators: { notEmpty: { message: "Valid email address is required" },regexp: {regexp: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/, message: 'Please Enter valid Email Address'}, remote: {method:'POST', url: 'index.php?file=admin/admin_list', data: {type: 'email_exist_check', admin_id: $('.admin_id').val()}, message: 'This email is already exist!'} } },
					   admin_password: { validators: { notEmpty: { message: "Password is required" },regexp: {regexp: /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{0,10}$/, message:'Password must be contain atleast 1 UpperCase, 1 LowerCase, 1 Special Character and 1 digit.'}, stringLength: { min: 8, message: 'Minimum 8 characters required.'	}, identical: { compare: function () { return e.querySelector('[name="admin_c_password"]').value;}, message: 'Password and Confirm Password shoud be same.'}  } },
					   admin_c_password: { validators: { notEmpty: { message: "Password is required" }, identical: { compare: function () { return e.querySelector('[name="admin_password"]').value;}, message: 'Password and Confirm Password shoud be same.'} } } },
                    plugins: { trigger: new FormValidation.plugins.Trigger(), bootstrap: new FormValidation.plugins.Bootstrap5({ rowSelector: ".fv-row", eleInvalidClass: "", eleValidClass: "" }) },
                });
				/*$('body').on('click', '.edit_admin', function() {
					alert(1);
					var admin_id = $(this).attr('data-id');
					alert(admin_id)
					$('.admin_id').val(admin_id);
					o.revalidateField('admin_email');
				});
				$('body').on('click', '.add_admin', function() {
					alert(2);
					var admin_id = 0;
					alert(admin_id)
					$('.admin_id').val(admin_id);
					o.revalidateField('admin_email');
				});
				$('body').on('click', '.add_admin', function() {
					alert(12);
					$('#kt_modal_add_admin_form .invalid-feedback').empty();
					//$("input[name='admin_id']").remove();
					//$("#kt_modal_add_admin_form").prepend('<input type="hidden" name="admin_id" value=0 class="admin_id" />');	   
					$('.admin_id').val(0);
					o.revalidateField('admin_email');
				});
				
				$('body').on('click', '.edit_admin', function() {
					alert(21);
					$('#kt_modal_add_admin_form .invalid-feedback').empty();
					$('#kt_modal_add_admin_header .fw-bolder').text('Edit Admin');
					var admin_id = $(this).attr('data-id');
					$.ajax({
					   type: "POST",
					   url: 'index.php?file=admin/admin_list',
					   data: 'edit_admin=Y&admin_id='+admin_id,
					   dataType: 'json',
					   success: function(response) 
					   {
						   var admin_id = response.admin_id;
						   var first_name = response.first_name;
						   var last_name = response.last_name;
						   var email = response.email;
						   var password = response.password;
						   var status = response.status;
						   
						   //$("input[name='admin_id']").remove();
						   //$("#kt_modal_add_admin_form").prepend('<input type="hidden" name="admin_id" value='+admin_id+' class="admin_id" />');
						   $('.admin_id').val(admin_id);
						   
						   $("input[name='first_name']").val(first_name);
						   $("input[name='last_name']").val(last_name);
						   $("input[name='admin_email']").val(email);
						   $("input[name='admin_password']").val(password);
						   $("input[name='admin_c_password']").val(password);
						   $("#kt_modal_add_admin_form input[name='status']").val(status);
						   $("#kt_modal_add_admin_form input[name='status']").attr('data-id', admin_id)
						   if(status=='N') {
							  $("#kt_modal_add_admin_form input[name='status']").prop('checked', false);
						   }
						   o.revalidateField('admin_email');
					   }
					});	
					
				});*/
				
                const i = t.querySelector('[data-kt-admins-modal-action="submit"]');
                i.addEventListener("click", (t) => {
                    t.preventDefault(),
                        o &&
                            o.validate().then(function (t) {
                                console.log("validated!"),
                                    "Valid" == t
                                        ? (i.setAttribute("data-kt-indicator", "on"),
                                          (i.disabled = !0),
                                          setTimeout(function () {
											  var formData	= $('#kt_modal_add_admin_form').serialize();
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
														  //window.location = 'index.php?file=admin/admin_list';
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
                    t.querySelector('[data-kt-admins-modal-action="cancel"]').addEventListener("click", (t) => {
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
                    t.querySelector('[data-kt-admins-modal-action="close"]').addEventListener("click", (t) => {
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
    KTAdminsAddAdmin.init();
});
