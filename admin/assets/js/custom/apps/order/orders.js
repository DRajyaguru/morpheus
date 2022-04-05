"use strict";
var KTOrder = (function () {
    var e,
        t,
        n,
        r,
        o = document.getElementById("order_table");
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
					"ajax": "script/order/orderlist_data.php",
                    columnDefs: [
                        { orderable: !1, targets: 0 },
                        { orderable: !1, targets: 4 },
						{"targets":[], "className":"text-end"},
                    ],
                })).on("draw", function () {
					KTMenu.createInstances();
                }),
                document.querySelector('[order-filter="search"]').addEventListener("keyup", function (t) {
                    e.search(t.target.value).draw();
                    
                }),
                (() => {
                })());
        },
    };
})();
KTUtil.onDOMContentLoaded(function () {
    KTOrder.init();
});