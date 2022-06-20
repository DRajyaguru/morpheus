"use strict";
var OrdersList = (function () {
    var e,
        t,
        n,
        r,
        o = document.getElementById("order_table");
    return {
        init: function () {
            o &&
                (e = $(o).DataTable({
                    info: !1,
                    order: [],
                    pageLength: 10,
                    lengthChange: !1,
					"processing": true,
					"serverSide": true,
					"sServerMethod": "POST",
					"ajax": "script/order/orderlist_data.php",
                    columnDefs: [
                        { orderable: !1, targets: 0 },
                        { orderable: !1, targets: 4 },
						{"targets":[2,3], "className":"text-center pe-0"},
						{"targets":[4], "className":"text-end pe-0"},
                    ],
                })).on("draw", function () {
					KTMenu.createInstances();
                }),
                document.querySelector('[order-filter="search"]').addEventListener("keyup", function (t) {
                    e.search(t.target.value).draw();
                });
        },
    };
})();
KTUtil.onDOMContentLoaded(function () {
    OrdersList.init();
});