"use strict";
var AdminsList = (function () {
    var e,
        t,
        n,
        r,
        o = document.getElementById("admin_table"),
        c = () => {
            o.querySelectorAll('[admins-table-filter="delete_row"]').forEach((t) => {
                t.addEventListener("click", function (t) {
                    t.preventDefault();
                    const n = t.target.closest("tr"),
                        r = n.querySelectorAll("td")[1].innerText;
					var admins_id = $(this).attr('data-id');
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
							delete_selected_admins(admins_id);
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
            (t = document.querySelector('[admin-table-toolbar="base"]')), (n = document.querySelector('[admin-table-toolbar="selected"]')), (r = document.querySelector('[admin-table-select="selected_count"]'));
            const s = document.querySelector('[admin-table-select="delete_selected"]');
            c.forEach((e) => {
                e.addEventListener("click", function () {
                    setTimeout(function () {
                        a();
                    }, 50);
                });
            }),
			s.addEventListener("click", function () {
				Swal.fire({
					text: "Are you sure you want to delete selected admins?",
					icon: "warning",
					showCancelButton: !0,
					buttonsStyling: !1,
					confirmButtonText: "Yes, delete!",
					cancelButtonText: "No, cancel",
					customClass: { confirmButton: "btn fw-bold btn-danger", cancelButton: "btn fw-bold btn-active-light-primary" },
				}).then(function (t) {
					if(t.value) {
						var admins_id = [];
						c.forEach((t) => {
							if(t.checked) {
								$(t).closest("tbody tr").remove()
								var value = $(t).val();
								admins_id.push(value);
							}
						});
						
						delete_selected_admins(admins_id);
					} 
					t.value
						? Swal.fire({ text: "You have deleted all selected admins!.", icon: "success", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } })
							  .then(function () {
								  o.querySelectorAll('[type="checkbox"]')[0].checked = !1;
							  })
							  .then(function () {
								  a(), l();
							  })
						: "cancel" === t.dismiss &&
						  Swal.fire({ text: "Selected admins was not deleted.", icon: "error", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } });
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
                document.querySelector('[admin-table-filter="search"]').addEventListener("keyup", function (t) {
                    e.search(t.target.value).draw();
                }),
                c();
        },
    };
})();
KTUtil.onDOMContentLoaded(function () {
    AdminsList.init();
});

$('body').on('click', '.add_admin', function() {
	$('#add_admin_form .invalid-feedback').empty();
	$('.admin_id').val(0);
});

$('body').on('click', '.edit_admin', function() {
	$('#add_admin_form .invalid-feedback').empty();
	$('#add_admin_header .fw-bolder').text('Edit Admin');
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
		   
		   $(".admin_id").val(admin_id);
		   $("input[name='first_name']").val(first_name);
		   $("input[name='last_name']").val(last_name);
		   $("input[name='admin_email']").val(email);
		   $("input[name='admin_password']").val(password);
		   $("input[name='admin_c_password']").val(password);
		   $("#add_admin_form input[name='status']").val(status);
		   $("#add_admin_form input[name='status']").attr('data-id', admin_id)
		   if(status=='N') {
			  $("#add_admin_form input[name='status']").prop('checked', false);
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

function delete_selected_admins(admins_id) {
	var dataString	= 'delete_data=Y&admins_id=' + admins_id;					
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