"use strict";
var KTAdminsList = (function () {
    var e,
        t,
        n,
        r,
        o = document.getElementById("kt_table_admins"),
        c = () => {
            o.querySelectorAll('[data-kt-admins-table-filter="delete_row"]').forEach((t) => {
                t.addEventListener("click", function (t) {
                    t.preventDefault();
                    const n = t.target.closest("tr"),
                        r = n.querySelectorAll("td")[1].innerText;
					var delete_admins = $(this).attr('data-id');
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
							delete_selected_admins(delete_admins);
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
            (t = document.querySelector('[data-kt-admin-table-toolbar="base"]')), (n = document.querySelector('[data-kt-admin-table-toolbar="selected"]')), (r = document.querySelector('[data-kt-admin-table-select="selected_count"]'));
            const s = document.querySelector('[data-kt-admin-table-select="delete_selected"]');
            c.forEach((e) => {
                e.addEventListener("click", function () {
                    setTimeout(function () {
                        a();
                    }, 50);
                });
            }),
			s.addEventListener("click", function () {
				Swal.fire({
					text: "Are you sure you want to delete selected admin?",
					icon: "warning",
					showCancelButton: !0,
					buttonsStyling: !1,
					confirmButtonText: "Yes, delete!",
					cancelButtonText: "No, cancel",
					customClass: { confirmButton: "btn fw-bold btn-danger", cancelButton: "btn fw-bold btn-active-light-primary" },
				}).then(function (t) {
					if(t.value) {
						var delete_admins = [];
						c.forEach((t) => {
							if(t.checked) {
								$(t).closest("tbody tr").remove()
								var value = $(t).val();
								delete_admins.push(value);
							}
						});
						
						delete_selected_admins(delete_admins);
					} 
					t.value
						? Swal.fire({ text: "You have deleted all selected admins!.", icon: "success", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } })
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
						  Swal.fire({ text: "Selected admin was not deleted.", icon: "error", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } });
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
                (o.querySelectorAll("tbody tr").forEach((e) => {
                    const t = e.querySelectorAll("td"),
                        n = t[3].innerText.toLowerCase();
                    let r = 0,
                        o = "minutes";
                    n.includes("yesterday")
                        ? ((r = 1), (o = "days"))
                        : n.includes("mins")
                        ? ((r = parseInt(n.replace(/\D/g, ""))), (o = "minutes"))
                        : n.includes("hours")
                        ? ((r = parseInt(n.replace(/\D/g, ""))), (o = "hours"))
                        : n.includes("days")
                        ? ((r = parseInt(n.replace(/\D/g, ""))), (o = "days"))
                        : n.includes("weeks") && ((r = parseInt(n.replace(/\D/g, ""))), (o = "weeks"));
                    const c = moment().subtract(r, o).format();
                    t[3].setAttribute("data-order", c);
                    const l = moment(t[5].innerHTML, "DD MMM YYYY, LT").format();
                    t[5].setAttribute("data-order", l);
                }),
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
					"ajax": "script/admin/adminlist_data.php",
                    columnDefs: [
                        { orderable: !1, targets: 0 },
                        { orderable: !1, targets: 5 },
						{"targets":[5], "className":"text-end"},
                    ],
                })).on("draw", function () {
                    l(), c(), a();
					KTMenu.createInstances();
                }),
                l(),
                document.querySelector('[data-kt-admin-table-filter="search"]').addEventListener("keyup", function (t) {
                    e.search(t.target.value).draw();
                }),
                c(),
                (() => {
                })());
        },
    };
})();
KTUtil.onDOMContentLoaded(function () {
    KTAdminsList.init();
});

$('body').on('click', '.add_admin', function() {
	$('#kt_modal_add_admin_form .invalid-feedback').empty();
	$("input[name='admin_id']").remove();
    $("#kt_modal_add_admin_form").prepend('<input type="hidden" name="admin_id" value=0 class="admin_id" />');
});

$('body').on('click', '.edit_admin', function() {
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
		   
		   $("input[name='admin_id']").remove();
		   $("#kt_modal_add_admin_form").prepend('<input type="hidden" name="admin_id" value='+admin_id+' class="admin_id" />');
		   
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
	   }
	});	
});

$('body').on('click', '.status', function() {
	var admin_id  = $(this).attr("data-id");
	
	if($(this).is(':checked')) {
	   $(this).val('Y');	
	   var status_val = 'Y';
    } else {
	   $(this).val('N');
	   var status_val = 'N';
    }
				
	var dataString	= 'status_change=Y&admin_id=' + admin_id +'&status_val=' + status_val;
	
	$.ajax({
	   type: "POST",
	   url: 'index.php?file=admin/admin_list',
	   data: dataString,
	   success: function(response) 
	   {}
	});	
});

function delete_selected_admins(delete_admins) {
	var dataString	= 'delete_data=Y&delete_admins=' + delete_admins;					
	$.ajax({
	   type: "POST",
	   url: 'index.php?file=admin/admin_list',
	   data: dataString,
	   success: function(response) 
	   {
		   setTimeout(function(){ swal.close(); }, 1500);
		}
	});
}