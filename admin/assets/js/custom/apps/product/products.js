"use strict";
var ProductsList = (function () {
    var t,
        e,
		n,
        r,
		o = document.getElementById("product_table"),
        c = () => {
            o.querySelectorAll('[product-filter="delete_row"]').forEach((t) => {
                t.addEventListener("click", function (t) {
                    t.preventDefault();
                    const o = t.target.closest("tr"),
                        n = o.querySelector('[product-filter="product_name"]').innerText;
					var products_id = $(this).attr('data-id');		
                    Swal.fire({
                        text: "Are you sure you want to delete " + n + "?",
                        icon: "warning",
                        showCancelButton: !0,
                        buttonsStyling: !1,
                        confirmButtonText: "Yes, delete!",
                        cancelButtonText: "No, cancel",
                        customClass: { confirmButton: "btn fw-bold btn-danger", cancelButton: "btn fw-bold btn-active-light-primary" },
                    }).then(function (t) {
						if(t.value) {
							delete_selected_product(products_id);
						}
                        t.value
                            ? Swal.fire({ text: "You have deleted " + n + "!.", icon: "success", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } })
								  .then(function () {
                                  	  e.row($(o)).remove().draw();
                              	  })
							  	  .then(function () {
                                      a();
                                  })
                            : "cancel" === t.dismiss && Swal.fire({ text: n + " was not deleted.", icon: "error", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } });
                    });
                });
            });
        },
		l = () => {
            const c = o.querySelectorAll('[type="checkbox"]:not(.status)');
            (t = document.querySelector('[product-table-toolbar="base"]')), (n = document.querySelector('[product-table-toolbar="selected"]')), (r = document.querySelector('[product-table-select="selected_count"]'));
            const s = document.querySelector('[product-table-select="delete_selected"]');
            c.forEach((e) => {
                e.addEventListener("click", function () {
                    setTimeout(function () {
                        a();
                    }, 50);
                });
            }),
			s.addEventListener("click", function () {
				Swal.fire({
					text: "Are you sure you want to delete selected products?",
					icon: "warning",
					showCancelButton: !0,
					buttonsStyling: !1,
					confirmButtonText: "Yes, delete!",
					cancelButtonText: "No, cancel",
					customClass: { confirmButton: "btn fw-bold btn-danger", cancelButton: "btn fw-bold btn-active-light-primary" },
				}).then(function (t) {
					if(t.value) {
						var products_id = [];
						c.forEach((t) => {
							if(t.checked) {
								$(t).closest("tbody tr").remove()
								var value = $(t).val();
								products_id.push(value);
							}
						});
						delete_selected_product(products_id);
					} 
					t.value
						? Swal.fire({ text: "You have deleted all selected products!.", icon: "success", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } })
							  .then(function () {
								  o.querySelectorAll('[type="checkbox"]')[0].checked = !1;
							  })
							  .then(function () {
								  a(), l();
							  })
						: "cancel" === t.dismiss &&
						  Swal.fire({ text: "Selected products was not deleted.", icon: "error", buttonsStyling: !1, confirmButtonText: "Ok, got it!", customClass: { confirmButton: "btn fw-bold btn-primary" } });
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
            (t = document.querySelector("#product_table")) &&
                ((e = $(t).DataTable({
                    info: !1,
                    order: [[ 4, "asc" ]],
                    pageLength: 10,
					lengthChange: !1,
					"processing": true,
					"serverSide": true,
					"sServerMethod": "POST",
					"ajax": "script/product/productlist_data.php",
                    columnDefs: [
                        { orderable: !1, targets: 0 },
                        { orderable: !1, targets: 6 },
						{"targets":[2,3,4,5,6], "className":"text-end pe-0"},
                    ],
                })).on("draw", function () {
                    l(), c(), a();
					KTMenu.createInstances();
                }),
                document.querySelector('[product-filter="search"]').addEventListener("keyup", function (t) {
                    e.search(t.target.value).draw();
                }),
                (() => {
                    const t = document.querySelector('[product-filter="status"]');
                    $(t).on("change", (t) => {
                        let o = t.target.value;
                        "all" === o && (o = ""), e.column(6).search(o).draw();
                    });
                })(),
                c());
        },
    };
})();
KTUtil.onDOMContentLoaded(function () {
    ProductsList.init();
});

$('body').on('click', '.status', function() {
	var product_id  = $(this).attr("data-id");
	
	if($(this).is(':checked')) {
	   $(this).val('Y');	
	   var status_val = 'Y';
    } else {
	   $(this).val('N');
	   var status_val = 'N';
    }
				
	var dataString	= 'status_change=Y&product_id=' + product_id +'&status_val=' + status_val;
	
	$.ajax({
	   type: "POST",
	   url: 'index.php?file=product/product_list',
	   data: dataString,
	   success: function(response) 
	   {}
	});	
});

function delete_selected_product(products_id) {
	var dataString	= 'delete_data=Y&products_id=' + products_id;					
	$.ajax({
	   type: "POST",
	   url: 'index.php?file=product/product_list',
	   data: dataString,
	   success: function(response) 
	   {
		   setTimeout(function(){ swal.close(); }, 1500);
		}
	});
}

$('body').on('click', '.update_product_position', function() {
  var obj = [];
  $('.display_order_val').each(function(i,v){
     obj.push({'product_id':$(v).attr('data-id'),'display_order': $(v).val()});
  });
  var product_data = JSON.stringify(obj); 
  $.ajax({
	   type: "POST",
	   url: 'index.php?file=product/product_list',
	   data: 'update_display_order=Y&product_data='+product_data,
	   dataType: "json",
	   success: function(response) 
	   {
		   if(response==true){
		    window.location = 'index.php?file=product/product_list';
		   }
	   }
  });
});