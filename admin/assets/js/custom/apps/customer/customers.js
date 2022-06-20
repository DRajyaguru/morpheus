"use strict";
var CustomersList = (function () {
    var e,
        t,
        n,
        r,
        o = document.getElementById("customer_table"),
        c = () => {
            o.querySelectorAll('[customer-filter="delete_row"]').forEach((t) => {
                t.addEventListener("click", function (t) {
                    t.preventDefault();
                    const n = t.target.closest("tr"),
                        r = n.querySelector('[customer-filter="first_name"]').innerText;
					var customers_id = $(this).attr('data-id');
                    Swal.fire({
                        text: "Are you sure you want to delete " + r + "?",
                        icon: "warning",
                        showCancelButton: !0,
                        buttonsStyling: !1,
                        confirmButtonText: "Yes, delete!",
                        cancelButtonText: "No, cancel",
                        customClass: { confirmButton: "btn fw-bold btn-danger", cancelButton: "btn fw-bold btn-active-light-primary" },
                    }).then(function (t) {
						if(t.value) {
							delete_selected_customer(customers_id);
						}
                        t.value
                            ? Swal.fire({ text: "You have deleted " + r + "!.", icon: "success", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } })
                                  .then(function () {
                                      e.row($(n)).remove().draw();
                                  })
                                  .then(function () {
                                      a();
                                  })
                            : "cancel" === t.dismiss && Swal.fire({ text: r + " was not deleted.", icon: "error", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } });
                    });
                });
            });
        },
        l = () => {
            const c = o.querySelectorAll('[type="checkbox"]:not(.status)');
            (t = document.querySelector('[customer-table-toolbar="base"]')), (n = document.querySelector('[customer-table-toolbar="selected"]')), (r = document.querySelector('[customer-table-select="selected_count"]'));
            const s = document.querySelector('[customer-table-select="delete_selected"]');
			
            c.forEach((e) => {
                e.addEventListener("click", function () {
                    setTimeout(function () {
                        a();
						var checked_length = o.querySelectorAll('[type="checkbox"]:not(.status):checked').length;
						if(checked_length!=0) {
						 $('.add_batch_credit').removeAttr('disabled')	
						} else {
						 $('.add_batch_credit').attr('disabled','disabled')	 	
						}
                    }, 50);
                });
            }),
			
			s.addEventListener("click", function () {
				Swal.fire({
					text: "Are you sure you want to delete selected customers?",
					icon: "warning",
					showCancelButton: !0,
					buttonsStyling: !1,
					confirmButtonText: "Yes, delete!",
					cancelButtonText: "No, cancel",
					customClass: { confirmButton: "btn fw-bold btn-danger", cancelButton: "btn fw-bold btn-active-light-primary" },
				}).then(function (t) {
					if(t.value) {
						var customers_id = [];
						c.forEach((t) => {
							if(t.checked) {
								$(t).closest("tbody tr").remove()
								var value = $(t).val();
								customers_id.push(value);
							}
						});
						delete_selected_customer(customers_id);
					} 
					t.value
						? Swal.fire({ text: "You have deleted all selected customers!.", icon: "success", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } })
							  .then(function () {
								  c.forEach((t) => {
									  /*t.checked &&
										  e
											  .row($(t.closest("tbody tr")))
											  .remove()
											  .draw();*/
								  });
								  o.querySelectorAll('[type="checkbox"]')[0].checked = !1;
							  })
							  .then(function () {
								  a(), l();
							  })
						: "cancel" === t.dismiss &&
						  Swal.fire({ text: "Selected customers was not deleted.", icon: "error", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } });
				});
			});
        };
    const a = () => {
        const e = o.querySelectorAll('tbody [type="checkbox"]:not(.status)');
		
        let c = !1,
            l = 0;
        e.forEach((e) => {
            e.checked && ((c = !0), l++);
        }),
            c ? ((r.innerHTML = l), t.classList.add("d-none"), n.classList.remove("d-none")) : (t.classList.remove("d-none"), n.classList.add("d-none"));
    };
    return {
        init: function () {
            o &&
                (o.querySelectorAll("tbody tr").forEach((e) => {}),
                (e = $(o).DataTable({
                    info: !1,
                    order: [],
					/*lengthMenu: [
						[5,10,20,50,100,200,-1],
						[5,10,20,50,100,200,'ALL']
					],*/
                    pageLength: 10,
                    lengthChange: !1,
					"processing": true,
					"serverSide": true,
					"sServerMethod": "POST",
					"ajax": "script/customer/customerlist_data.php",
                    columnDefs: [
                        { orderable: !1, targets: 0 },
                        { orderable: !1, targets: 6 },
						{"targets":[6], "className":"text-end"},
                    ],
                })).on("draw", function () {
                    l(), c(), a();
					KTMenu.createInstances();
                }),
                l(),
                document.querySelector('[customer-filter="search"]').addEventListener("keyup", function (t) {
                    e.search(t.target.value).draw();
                }),
                c(),
                (() => {
                })());
        },
    };
})();
KTUtil.onDOMContentLoaded(function () {
    CustomersList.init();
});


$('body').on('click', '.status', function() {
	var customer_id  = $(this).attr("data-id");
	
	if($(this).is(':checked')) {
	   $(this).val('Y');	
	   var status_val = 'Y';
    } else {
	   $(this).val('N');
	   var status_val = 'N';
    }
				
	var dataString	= 'status_change=Y&customer_id=' + customer_id +'&status_val=' + status_val;
	
	$.ajax({
	   type: "POST",
	   url: 'index.php?file=customer/customer_list',
	   data: dataString,
	   success: function(response) 
	   {}
	});	
});

function delete_selected_customer(customers_id) {
	var dataString	= 'delete_data=Y&customers_id=' + customers_id;					
	$.ajax({
	   type: "POST",
	   url: 'index.php?file=customer/customer_list',
	   data: dataString,
	   success: function(response) 
	   {
		   setTimeout(function(){ swal.close(); }, 1500);
		}
	});
}



"use strict";
var SaveCredits = (function () {
    const t = document.getElementById("add_batch_credit"),
        e = t.querySelector("#add_batch_credit_form"),
        n = new bootstrap.Modal(t);
		
    return {
        init: function () {
            (() => {
                var o = FormValidation.formValidation(e, {
                    fields: { 
					   credits: { validators: {notEmpty:{message:"Credits is required"},stringLength: {max: 5, message: "Maximum 5 digits allowed." }, regexp: {regexp: /^[0-9_\ ]+$/, message: 'Please enter digits only.'} } } },
                    plugins: { trigger: new FormValidation.plugins.Trigger(), bootstrap: new FormValidation.plugins.Bootstrap5({ rowSelector: ".fv-row", eleInvalidClass: "", eleValidClass: "" }) },
                });
                const i = t.querySelector('[credits-modal-action="submit"]');
                i.addEventListener("click", (t) => {
                    t.preventDefault(),
                        o &&
                            o.validate().then(function (t) {
                                console.log("validated!"),
                                    "Valid" == t
                                        ? (i.setAttribute("data-kt-indicator", "on"),
                                          (i.disabled = !0),
                                          setTimeout(function () {
											  var customers_id = [];
											  $('tbody [type="checkbox"]:not(.status):checked').each(function() {
												 var value = this.value;
												 customers_id.push(value);
											  });
											   //var formData	= $('#add_batch_credit_form').serialize();
											  var total_credits = $('.total_credits').val();
											  
											  $.ajax({
												   type: "POST",
												   url: 'index.php?file=customer/customer_list',
												   data: 'batch_credit=Y&total_credits='+total_credits+'&customer_ids='+customers_id,
												   success: function(response) 
												   {
													   setTimeout(function(){ 
													   	swal.close(); n.hide();}, 
													   1500);
													   setTimeout(function(){ 
													    window.location = 'index.php?file=customer/customer_list'; 
													   }, 2000);
												}
											  });
                                              i.removeAttribute("data-kt-indicator"),
                                                  (i.disabled = !1),
                                                  Swal.fire({ text: "Batch Credits has been successfully added for selected customers!", icon: "success", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn btn-primary" } }).then(
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
                    t.querySelector('[credits-modal-action="cancel"]').addEventListener("click", (t) => {
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
                    t.querySelector('[credits-modal-action="close"]').addEventListener("click", (t) => {
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
    SaveCredits.init();
});