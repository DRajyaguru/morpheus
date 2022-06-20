"use strict";
var WebpagesList = (function () {
    var e,
        t,
        n,
        r,
        o = document.getElementById("webpage_table"),
        c = () => {
            o.querySelectorAll('[webpage-filter="delete_row"]').forEach((t) => {
                t.addEventListener("click", function (t) {
                    t.preventDefault();
                    const n = t.target.closest("tr"),
                        r = n.querySelector('[webpage-filter="page_title"]').innerText;
					var webpages_id = $(this).attr('data-id');
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
							delete_selected_webpage(webpages_id);
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
            (t = document.querySelector('[webpage-table-toolbar="base"]')), (n = document.querySelector('[webpage-table-toolbar="selected"]')), (r = document.querySelector('[webpage-table-select="selected_count"]'));
            const s = document.querySelector('[webpage-table-select="delete_selected"]');
			
            c.forEach((e) => {
                e.addEventListener("click", function () {
                    setTimeout(function () {
                        a();
                    }, 50);
                });
            }),
			
			s.addEventListener("click", function () {
				Swal.fire({
					text: "Are you sure you want to delete selected webpages?",
					icon: "warning",
					showCancelButton: !0,
					buttonsStyling: !1,
					confirmButtonText: "Yes, delete!",
					cancelButtonText: "No, cancel",
					customClass: { confirmButton: "btn fw-bold btn-danger", cancelButton: "btn fw-bold btn-active-light-primary" },
				}).then(function (t) {
					if(t.value) {
						var webpages_id = [];
						c.forEach((t) => {
							if(t.checked) {
								$(t).closest("tbody tr").remove()
								var value = $(t).val();
								webpages_id.push(value);
							}
						});
						delete_selected_webpage(webpages_id);
					} 
					
					t.value
						? Swal.fire({ text: "You have deleted all selected webpages!.", icon: "success", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } })
							  .then(function () {
								  o.querySelectorAll('[type="checkbox"]')[0].checked = !1;
							  })
							  .then(function () {
								  a(), l();
							  })
						: "cancel" === t.dismiss &&
						  Swal.fire({ text: "Selected webpages was not deleted.", icon: "error", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } });
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
					"ajax": "script/webpage/webpagelist_data.php",
                    columnDefs: [
                        { orderable: !1, targets: 0 },
                        { orderable: !1, targets: 3 },
						{"targets":[3], "className":"text-end"},
                    ],
                })).on("draw", function () {
                    l(), c(), a();
					KTMenu.createInstances();
                }),
                l(),
                document.querySelector('[webpage-filter="search"]').addEventListener("keyup", function (t) {
                    e.search(t.target.value).draw();
                }),
                c(),
                (() => {
                })());
        },
    };
})();
KTUtil.onDOMContentLoaded(function () {
    WebpagesList.init();
});

$('body').on('click', '.status', function() {
	var webpage_id  = $(this).attr("data-id");
	
	if($(this).is(':checked')) {
	   $(this).val('Y');	
	   var status_val = 'Y';
    } else {
	   $(this).val('N');
	   var status_val = 'N';
    }
				
	var dataString	= 'status_change=Y&webpage_id=' + webpage_id +'&status_val=' + status_val;
	
	$.ajax({
	   type: "POST",
	   url: 'index.php?file=webpage/webpage_list',
	   data: dataString,
	   success: function(response) 
	   {}
	});	
});

function delete_selected_webpage(webpages_id) {
	var dataString	= 'delete_data=Y&webpages_id=' + webpages_id;					
	$.ajax({
	   type: "POST",
	   url: 'index.php?file=webpage/webpage_list',
	   data: dataString,
	   success: function(response) 
	   {
		   setTimeout(function(){ swal.close(); }, 1500);
		}
	});
}