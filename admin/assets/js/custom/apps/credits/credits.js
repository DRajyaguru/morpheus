"use strict";
var KTCredits = (function () {
    var t,
        e,
        n = () => {
            t.querySelectorAll('[credits-filter="delete_row"]').forEach((t) => {
                t.addEventListener("click", function (t) {
                    t.preventDefault();
                    const n = t.target.closest("tr"),
                        o = n.querySelector('[credits-filter="package_name"]').innerText;
					var delete_credits = $(this).attr('data-id');	
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
							delete_selected_credits(delete_credits);
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
            (t = document.querySelector('[data-credits-table-toolbar="base"]')), (n = document.querySelector('[data-credits-table-toolbar="selected"]')), (r = document.querySelector('[data-credits-table-select="selected_count"]'));
            const s = document.querySelector('[data-credits-table-select="delete_selected"]');
            c.forEach((e) => {                
                e.addEventListener("click", function () {
                    setTimeout(function () {
                        a();
                    }, 50);
                });
            }),
			s.addEventListener("click", function () {
				Swal.fire({
					text: "Are you sure you want to delete selected credits?",
					icon: "warning",
					showCancelButton: !0,
					buttonsStyling: !1,
					confirmButtonText: "Yes, delete!",
					cancelButtonText: "No, cancel",
					customClass: { confirmButton: "btn fw-bold btn-danger", cancelButton: "btn fw-bold btn-active-light-primary" },
				}).then(function (t) {
					if(t.value) {
						var delete_credits = [];
						c.forEach((t) => {
							if(t.checked) {
								$(t).closest("tbody tr").remove()
								var value = $(t).val();
								delete_credits.push(value);
							}
						});
						
						delete_selected_credits(delete_credits);
					} 
					t.value
						? Swal.fire({ text: "You have deleted all selected credits!.", icon: "success", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } })
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
						  Swal.fire({ text: "Selected credits was not deleted.", icon: "error", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } });
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
			
            (t = document.querySelector("#credits_table")) &&
                ((e = $(t).DataTable({
                    info: !1,
                    order: [],
                    pageLength: 10,
					lengthChange: !1,
					"processing": true,
					"serverSide": true,
					"sServerMethod": "POST",
					"ajax": "script/credits/creditslist_data.php",
                    columnDefs: [
                        { orderable: !1, targets: 0 },
                        { orderable: !1, targets: 5 },
						{"targets":[5], "className":"text-end"},
                    ],
                })).on("draw", function () {    
                    n();
					KTMenu.createInstances();
                }),
                document.querySelector('[credits-filter="search"]').addEventListener("keyup", function (t) {
                    e.search(t.target.value).draw();
                }),
                n());
        },
    };
})();
KTUtil.onDOMContentLoaded(function () {
    KTCredits.init();
});

$('body').on('click', '.status', function() {
	var credits_id  = $(this).attr("data-id");
	
	if($(this).is(':checked')) {
	   $(this).val('Y');	
	   var status_val = 'Y';
    } else {
	   $(this).val('N');
	   var status_val = 'N';
    }
				
	var dataString	= 'status_change=Y&credits_id=' + credits_id +'&status_val=' + status_val;
	
	$.ajax({
	   type: "POST",
	   url: 'index.php?file=credits/credits_list',
	   data: dataString,
	   success: function(response) 
	   {}
	});	
});

function delete_selected_credits(delete_credits) {
	var dataString	= 'delete_data=Y&delete_credits=' + delete_credits;					
	$.ajax({
	   type: "POST",
	   url: 'index.php?file=credits/credits_list',
	   data: dataString,
	   success: function(response) 
	   {
		   setTimeout(function(){ swal.close(); }, 1500);
		}
	});
}