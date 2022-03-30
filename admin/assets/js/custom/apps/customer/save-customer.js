"use strict";
var KTAppEcommerceSaveCustomer = (function () {
    const e = () => {},
        t = () => {};
    return {
        init: function () {
                e(),
                t(),
                (() => {
                    let e;
                    const t = document.getElementById("add_customer_form"),
                          o = document.getElementById("add_customer_submit");
                    (e = FormValidation.formValidation(t, {
                        fields: {
                            first_name: { validators: {notEmpty:{message:"First name is required"},regexp: {regexp: /^[a-zA-Z0-9_\ ]+$/, message: 'First name can only consist of alphanumeric and space.'} } },
                            last_name: { validators: {notEmpty:{message:"Last name is required"},regexp: {regexp: /^[a-zA-Z0-9_\ ]+$/, message: 'Last name can only consist of alphanumeric and space.'} } },
                            email_id: { validators: {notEmpty:{message:"Email ID is required"},regexp: {regexp: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/, message: 'Please Enter valid Email Address'}, remote: {method:'POST', url: 'index.php?file=customer/customer_add', data: {type: 'customer_email_check', customer_id: $('.customer_id').val()}, message: 'This Email is already exist!'} } },
                            phone_no: { validators: {notEmpty:{message:"Phone No. is required"},regexp: {regexp: /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/, message: 'Please enter valid phone number.'} } },
                            password: { validators: {notEmpty:{message:"Password is required"},regexp: {regexp: /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{0,10}$/, message:'Password must be contain atleast 1 UpperCase, 1 LowerCase, 1 Special Character and 1 digit.'},identical: { compare: function () { return t.querySelector('[name="confirm_password"]').value;}, message: 'Password and Confirm Password shoud be same.'} } },
                            confirm_password:{ validators : {notEmpty: { message: "Confirm Password is required"}, identical: { compare: function () { return t.querySelector('[name="password"]').value;}, message: 'Password and Confirm Password shoud be same.'}}},
                            address1: { validators: {notEmpty:{message:"Address 1 is required"} } },
                            address2: { validators: {notEmpty:{message:"Address 2 is required"} } },
                            city: { validators: {notEmpty:{message:"City is required"} } },
                            state: { validators: {notEmpty:{message:"State is required"} } },
                            country: { validators: {notEmpty:{message:"Country is required"} } },
                            zipcode: { validators: {notEmpty:{message:"ZipCode is required"} } },                         	
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
                                                var formData	= $('#add_customer_form').serialize();
                                                var customer_id = $('.customer_id').val();
                                                  if(customer_id) {
                                                     var text_msg = "customer has been successfully updated!";
                                                  } else {
                                                      var text_msg = "customer has been successfully added!"  
                                                  }
                                                  
                                                  $.ajax({
                                                       type: "POST",
                                                       url: 'index.php?file=customer/customer_add',
                                                       data: 'add_customer=Y&'+formData,
                                                       success: function(response) 
                                                       {
                                                        
                                                        setTimeout(function(){ 
                                                            swal.close();
                                                            window.location = 'index.php?file=customer/customer_list';
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
    KTAppEcommerceSaveCustomer.init();
});

$('body').on('click', '.status', function() {	
	if($(this).is(':checked')) {
	   $(this).val('Y');	
    } else {
	   $(this).val('N');
    }
});