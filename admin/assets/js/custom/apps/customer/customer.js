"use strict";
var KTCustomer = (function () {
    var t,
        e,
        n = () => {
            t.querySelectorAll('[customer-filter="delete_row"]').forEach((t) => {
                t.addEventListener("click", function (t) {
                    t.preventDefault();
                    const n = t.target.closest("tr"),
                        o = n.querySelector('[customer-filter="first_name"]').innerText;
					var delete_customer = $(this).attr('data-id');	
                    Swal.fire({
                        text: "Are you sure you want to delete " + o + "?",
                        icon: "warning",
                        showCancelButton: !0,
                        buttonsStyling: !1,
                        confirmButtonText: "Yes, delete!",
                        cancelButtonText: "No, cancel",
                        customClass: { confirmButton: "btn fw-bold btn-danger", cancelButton: "btn fw-bold btn-active-light-primary" },
                    }).then(function (t) {
						if(t.value) {
							delete_selected_customer(delete_customer);
						}
                        t.value
                            ? Swal.fire({ text: "You have deleted " + o + "!.", icon: "success", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } })
                            .then(function () {
                                  e.row($(n)).remove().draw();
                              })
                              .then(function(){
                                  a();
                              })
                            : "cancel" === t.dismiss && Swal.fire({ text: o + " was not deleted.", icon: "error", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } });
                    });
                });
            });
        },
        l = () => {
            const c = o.querySelectorAll('[type="checkbox"]:not(.status)');
            (t = document.querySelector('[data-customer-table-toolbar="base"]')), (n = document.querySelector('[data-customer-table-toolbar="selected"]')), (r = document.querySelector('[data-customer-table-select="selected_count"]'));
            const s = document.querySelector('[data-customer-table-select="delete_selected"]');
            c.forEach((e) => {                
                e.addEventListener("click", function () {
                    setTimeout(function () {
                        a();
                    }, 50);
                });
            }),
			s.addEventListener("click", function () {
				Swal.fire({
					text: "Are you sure you want to delete selected customer?",
					icon: "warning",
					showCancelButton: !0,
					buttonsStyling: !1,
					confirmButtonText: "Yes, delete!",
					cancelButtonText: "No, cancel",
					customClass: { confirmButton: "btn fw-bold btn-danger", cancelButton: "btn fw-bold btn-active-light-primary" },
				}).then(function (t) {
					if(t.value) {
						var delete_customer = [];
						c.forEach((t) => {
							if(t.checked) {
								$(t).closest("tbody tr").remove()
								var value = $(t).val();
								delete_customer.push(value);
							}
						});
						
						delete_selected_customer(delete_customer);
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
			
            (t = document.querySelector("#customer_table")) &&
                ((e = $(t).DataTable({
                    info: !1,
                    order: [],
                    pageLength: 10,
					lengthChange: !1,
					"processing": true,
					"serverSide": true,
					"sServerMethod": "POST",
					"ajax": "script/customer/customerlist_data.php",
                    columnDefs: [
                        { orderable: !1, targets: 0 },
                        { orderable: !1, targets: 5 },
						{"targets":[5], "className":"text-end"},
                    ],
                })).on("draw", function () {
                    n();
					KTMenu.createInstances();
                }),
                document.querySelector('[customer-filter="search"]').addEventListener("keyup", function (t) {
                    e.search(t.target.value).draw();
                }),
                n());
        },
    };
})();
KTUtil.onDOMContentLoaded(function () {
    KTCustomer.init();
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

function delete_selected_customer(delete_customer) {
	var dataString	= 'delete_data=Y&delete_customer=' + delete_customer;					
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