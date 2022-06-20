"use strict";
var KTAppEcommerceSaveCompanyDetails = (function () {
    const e = () => {},
        t = () => {};
	var quill;	
    return {
        init: function () {
            ["#add_company_details"].forEach((e) => {
                let t = document.querySelector(e);
                t && (quill = new Quill(e, { modules: { toolbar: [ [{ header: [1, 2, 3, 4, 5, 6, !1] }], [{ 'header': 1 }, { 'header': 2 }], ['bold', 'italic', 'underline', 'strike'], ["link"], [{ 'list': 'ordered'}, { 'list': 'bullet' }], [{ 'script': 'sub'}, { 'script': 'super' }], ["blockquote", "code-block"], [{ 'color': [] }, { 'background': [] }], [{ 'align': [] }] ] }, placeholder: "Type your text here...", theme: "snow" }));
            }),
                e(),
                t(),
                (() => {
                    let e;
                    const t = document.getElementById("company_details_form"),
                          o = document.getElementById("company_details_submit");
                    (e = FormValidation.formValidation(t, {
                        fields: { company_name: { validators: {notEmpty:{message:"Company name is required"},regexp: {regexp: /^[a-zA-Z0-9_\ ]+$/, message: 'Company name can only consist of alphanumeric and space.'} } },
                                  company_email: { validators: {notEmpty:{message:"Email ID is required"},regexp: {regexp: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/, message: 'Please Enter valid Email Address'} } },
                                  company_phone_no: { validators: {notEmpty:{message:"Phone No. is required"},regexp: {regexp: /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/, message: 'Please enter valid phone number.'} } },
                                  company_icon: { validators: { file: { extension: 'jpg,jpeg,png', type: 'image/jpeg,image/png', message: "The selected file is not valid" } } }
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
                                                    //var formData	= $('#company_details_form').serialize();
													var company_details = quill.root.innerHTML.replace(/&nbsp;/gi,"");
													if($("#add_company_details .ql-editor").hasClass('ql-blank')) {
												   		 company_details = '';
													}
													var company_id = $('.company_id').val();
													  if(company_id) {
														 var text_msg = "Company details has been successfully updated!";
													  }

                                                    var company_logo = document.getElementById('company_icon').files[0];
													var formData = new FormData($('#company_details_form')[0]);
                                                    formData.append("company_detail", "Y");
                                                    formData.append("company_details", company_details);
                                                    formData.append("file",company_logo);

													  $.ajax({
														   type: "POST",
														   url: 'index.php?file=company_details/company_detail',
														   //data: 'company_details='+company_details+'&company_detail=Y&'+formData,
                                                           data: formData,
                                                           processData: false,
														   contentType: false,
														   success: function(response) 
														   {
                                                                // alert(response);
                                                                // return false;
                                                            setTimeout(function(){ 
																swal.close();
																window.location = 'index.php?file=company_details/company_detail';
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
    KTAppEcommerceSaveCompanyDetails.init();
});