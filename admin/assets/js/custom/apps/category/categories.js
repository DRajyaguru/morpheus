"use strict";
var CategoriesList = (function () {
    var t,
        e,
		n,
        r,
		o = document.getElementById("category_table"),
        c = () => {
            o.querySelectorAll('[category-filter="delete_row"]').forEach((t) => {
                t.addEventListener("click", function (t) {
                    t.preventDefault();
                    const n = t.target.closest("tr"),
                        o = n.querySelector('[category-filter="category_name"]').innerText;
					var categories_id = $(this).attr('data-id');	
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
							delete_selected_category(categories_id);
						}
                        t.value
                            ? Swal.fire({ text: "You have deleted " + o + "!.", icon: "success", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } }).then(function () {
                                  e.row($(n)).remove().draw();
                              })
                            : "cancel" === t.dismiss && Swal.fire({ text: o + " was not deleted.", icon: "error", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } });
                    });
                });
            });
        },
		l = () => {
            const c = o.querySelectorAll('[type="checkbox"]:not(.status)');
            (t = document.querySelector('[category-table-toolbar="base"]')), (n = document.querySelector('[category-table-toolbar="selected"]')), (r = document.querySelector('[category-table-select="selected_count"]'));
            const s = document.querySelector('[category-table-select="delete_selected"]');
            c.forEach((e) => {
                e.addEventListener("click", function () {
                    setTimeout(function () {
                        a();
                    }, 50);
                });
            }),
			s.addEventListener("click", function () {
				Swal.fire({
					text: "Are you sure you want to delete selected categories?",
					icon: "warning",
					showCancelButton: !0,
					buttonsStyling: !1,
					confirmButtonText: "Yes, delete!",
					cancelButtonText: "No, cancel",
					customClass: { confirmButton: "btn fw-bold btn-danger", cancelButton: "btn fw-bold btn-active-light-primary" },
				}).then(function (t) {
					if(t.value) {
						var categories_id = [];
						c.forEach((t) => {
							if(t.checked) {
								$(t).closest("tbody tr").remove()
								var value = $(t).val();
								categories_id.push(value);
							}
						});
						delete_selected_category(categories_id);
					} 
					t.value
						? Swal.fire({ text: "You have deleted all selected categories!.", icon: "success", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } })
							  .then(function () {
								  o.querySelectorAll('[type="checkbox"]')[0].checked = !1;
							  })
							  .then(function () {
								  a(), l();
							  })
						: "cancel" === t.dismiss &&
						  Swal.fire({ text: "Selected categories was not deleted.", icon: "error", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } });
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
            (t = document.querySelector("#category_table")) &&
                ((e = $(t).DataTable({
                    info: !1,
                    order: [[ 2, "asc" ]],
                    pageLength: 10,
					lengthChange: !1,
					"processing": true,
					"serverSide": true,
					"sServerMethod": "POST",
					"ajax": "script/category/categorylist_data.php",
                    columnDefs: [
                        { orderable: !1, targets: 0 },
                        { orderable: !1, targets: 4 },
						{"targets":[4], "className":"text-end"},
                    ],
                })).on("draw", function () {
                    l(), c(), a();
					KTMenu.createInstances();
                }),
                document.querySelector('[category-filter="search"]').addEventListener("keyup", function (t) {
                    e.search(t.target.value).draw();
                }),
                c());
        },
    };
})();
KTUtil.onDOMContentLoaded(function () {
    CategoriesList.init();
});

$('body').on('click', '.status', function() {
	var category_id  = $(this).attr("data-id");
	
	if($(this).is(':checked')) {
	   $(this).val('Y');	
	   var status_val = 'Y';
    } else {
	   $(this).val('N');
	   var status_val = 'N';
    }
				
	var dataString	= 'status_change=Y&category_id=' + category_id +'&status_val=' + status_val;
	
	$.ajax({
	   type: "POST",
	   url: 'index.php?file=category/category_list',
	   data: dataString,
	   success: function(response) 
	   {}
	});	
});

function delete_selected_category(categories_id) {
	var dataString	= 'delete_data=Y&categories_id=' + categories_id;					
	$.ajax({
	   type: "POST",
	   url: 'index.php?file=category/category_list',
	   data: dataString,
	   success: function(response) 
	   {
		   setTimeout(function(){ swal.close(); }, 1500);
		}
	});
}

$('body').on('click', '.update_category_position', function() {
  var obj = [];
  $('.display_order_val').each(function(i,v){
     obj.push({'category_id':$(v).attr('data-id'),'display_order': $(v).val()});
  });
  var category_data = JSON.stringify(obj); 
  $.ajax({
	   type: "POST",
	   url: 'index.php?file=category/category_list',
	   data: 'update_display_order=Y&category_data='+category_data,
	   dataType: "json",
	   success: function(response) 
	   {
		   if(response==true){
		    window.location = 'index.php?file=category/category_list';
		   }
	   }
  });
});
