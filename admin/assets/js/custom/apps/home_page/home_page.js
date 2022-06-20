"use strict";
var KTAppEcommerceSaveHomePage = (function () {
    const e = () => {},
        t = () => {};
    return {
        init: function () {
            ["#personlized_video_generator"].forEach((e) => {
                let t = document.querySelector(e);
                t && (t = new Quill(e, { modules: { toolbar: [[{ header: [1, 2, !1] }], ["bold", "italic", "underline"], ["code-block"]] }, placeholder: "Type your text here...", theme: "snow" }));
            }),
            ["#about_info"].forEach((e) => {
                let t = document.querySelector(e);
                t && (t = new Quill(e, { modules: { toolbar: [[{ header: [1, 2, !1] }], ["bold", "italic", "underline"], ["code-block"]] }, placeholder: "Type your text here...", theme: "snow" }));
            }),
                e(),
                t(),
                (() => {
                    let e;
                    const t = document.getElementById("home_page_form"),
                          o = document.getElementById("home_page_submit");
                    (e = FormValidation.formValidation(t, {
                        fields: { 
                                  top_banner: { validators: {notEmpty:{message:"Top Banner is required"} } },
                                  link_name: { validators: {notEmpty:{message:"Link Name is required"} } }
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
                                                    var personlized_video_generator = $("#personlized_video_generator .ql-editor").html();
                                                    var about_info = $("#about_info .ql-editor").html();
                                                    var name = $('.link_name').val();
                                                    var url = $('.link_url_input').val();
                                                    var link_status = $('.link_status').val();
                                                    var open_new_tab = $('.open_new_tab').val();
                                                    
													var home_page_id = $('.home_page_id').val();
													  if(home_page_id) {
														 var text_msg = "Home page has been successfully updated!";
													  }                                                   
													var formData = new FormData($('#home_page_form')[0]);
                                                    formData.append("home_page", "Y");
                                                    formData.append("personlized_video_generator",personlized_video_generator);
                                                    formData.append("about_info",about_info);
                                                    $.ajax({
														   type: "POST",
														   url: 'index.php?file=home_page/home_page',
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
																window.location = 'index.php?file=home_page/home_page';
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
    KTAppEcommerceSaveHomePage.init();
});

$(".link-btn").click(function(e){
    e.preventDefault();
    $(".card-body.link-body").append('<div class="extra_fields_input"><input type="text" name="link_name[]" class="form-control mb-3 link_name" placeholder="Name" value=""/><input type="text" name="link_url[]" class="form-control mb-3 link_url_input" placeholder="URL" value="" /><input type="hidden" name="link_status[]" class="link_status" value="No"/><input type="checkbox" name="link_status[]" class="link_status"><input type="hidden" name="open_new_tab[]" class="open_new_tab" value="No" /><input type="checkbox" name="open_new_tab[]" class="open_new_tab" ><a class="btn remove-btn" href=""><span class="svg-icon svg-icon-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"><rect x="4.36396" y="10.364" width="16" height="2" rx="1" fill="black"></rect></svg></span></a></div>');
});
var index = 0;
$(document).on('click','.remove-btn' ,function(e){
    e.preventDefault();
    $(this).parent().remove();
    // $(this).closest('.extra_field_input').remove();
});
    // $(document).on('click','input[type=checkbox]',function(){
//     if($(this).is(':checked')){
//         $(this).val("Yes");
//         console.log('checked');
//     }else{
//         $(this).val("No");
//         console.log('unchecked');
//     }
// });