<!--begin::Global Javascript Bundle(used by all pages)-->
<script src="assets/plugins/global/plugins.bundle.js" type="text/javascript"></script>
<script src="assets/js/scripts.bundle.js" type="text/javascript"></script>
<!--end::Global Javascript Bundle-->
{if $page eq 'admin' || $page eq 'dashboard' || $page eq 'category' || $page eq 'category_list' || $page eq 'webpage' || $page eq 'webpage_list' || $page eq 'customer' || $page eq 'customer_list' || $page eq 'credits' || $page eq 'credits_list' || $page eq 'orders' || $page eq 'order_list'}
<!--begin::Page Vendors Javascript(used by this page)-->
<script src="assets/plugins/custom/datatables/datatables.bundle.js"></script>
<!--end::Page Vendors Javascript-->
{/if}
{if $page eq 'login'}
<!--begin::Page Custom Javascript(used by this page)-->
<script src="assets/js/custom/sign-in/general.js" type="text/javascript"></script>
<!--end::Page Custom Javascript-->
{elseif $page eq 'admin'}
<!--begin::Page Custom Javascript(used by this page)-->
<script src="assets/js/custom/apps/admin-management/admins.js"></script>
<script src="assets/js/custom/apps/admin-management/save-admin.js"></script>
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>-->
<!--end::Page Custom Javascript-->
{elseif $page eq 'dashboard'}
<!--begin::Page Vendors Javascript(used by this page)-->
<script src="assets/plugins/custom/vis-timeline/vis-timeline.bundle.js" type="text/javascript"></script>
<!--end::Page Vendors Javascript-->
{elseif $page eq 'category'}
<!--begin::Page Vendors Javascript(used by this page)-->
<script src="assets/js/custom/apps/ecommerce/catalog/categories/save-category.js" type="text/javascript"></script>
<!--end::Page Vendors Javascript-->
{elseif $page eq 'category_list'}
<!--begin::Page Vendors Javascript(used by this page)-->
<script src="assets/js/custom/apps/ecommerce/catalog/categories/categories.js" type="text/javascript"></script>
<!--end::Page Vendors Javascript-->
{elseif $page eq 'product'}
<!--begin::Page Vendors Javascript(used by this page)-->
<script src="assets/js/custom/apps/ecommerce/catalog/products/save-product.js" type="text/javascript"></script>
<!--end::Page Vendors Javascript-->
{elseif $page eq 'product_list'}
<!--begin::Page Vendors Javascript(used by this page)-->
<script src="assets/js/custom/apps/ecommerce/catalog/products/products.js" type="text/javascript"></script>
<!--end::Page Vendors Javascript-->
{elseif $page eq 'webpage'}
<!--begin::Page Vendors Javascript(used by this page)-->
<script src="assets/js/custom/apps/webpage/save-webpage.js" type="text/javascript"></script>
<!--end::Page Vendors Javascript-->
{elseif $page eq 'webpage_list'}
<!--begin::Page Vendors Javascript(used by this page)-->
<script src="assets/js/custom/apps/webpage/webpage.js" type="text/javascript"></script>
<!--end::Page Vendors Javascript-->
{elseif $page eq 'customer'}
<!--begin::Page Vendors Javascript(used by this page)-->
<script src="assets/js/custom/apps/customer/save-customer.js" type="text/javascript"></script>
<!--end::Page Vendors Javascript-->
{elseif $page eq 'customer_list'}
<!--begin::Page Vendors Javascript(used by this page)-->
<script src="assets/js/custom/apps/customer/customer.js" type="text/javascript"></script>
<!--end::Page Vendors Javascript-->
{elseif $page eq 'credits'}
<!--begin::Page Vendors Javascript(used by this page)-->
<script src="assets/js/custom/apps/credits/save-credits.js" type="text/javascript"></script>
<!--end::Page Vendors Javascript-->
{elseif $page eq 'credits_list'}
<!--begin::Page Vendors Javascript(used by this page)-->
<script src="assets/js/custom/apps/credits/credits.js" type="text/javascript"></script>
<!--end::Page Vendors Javascript-->
{elseif $page eq 'order_list'}
<!--begin::Page Vendors Javascript(used by this page)-->
<script src="assets/js/custom/apps/order/orders.js" type="text/javascript"></script>
<!--end::Page Vendors Javascript-->


{/if}
{if $page eq 'admin' || $page eq 'dashboard' || $page eq 'category' || $page eq 'category_list' || $page eq 'webpage' || $page eq 'webpage_list' || $page eq 'customer' || $page eq 'customer_list' || $page eq 'credits' || $page eq 'credits_list' || $page eq 'order_list'}
<!--begin::Page Custom Javascript(used by this page)-->
<script src="assets/js/widgets.bundle.js"></script>
<script src="assets/js/custom/widgets.js"></script>
<script src="assets/js/custom/apps/chat/chat.js"></script>
<script src="assets/js/custom/utilities/modals/upgrade-plan.js"></script>
<script src="assets/js/custom/utilities/modals/users-search.js"></script>

<!--end::Page Custom Javascript-->
{/if}
<!--begin::iClerisy Custom Javascript-->
<script src="assets/js/iclerisy_custom.js" type="text/javascript"></script>
<!--end::iClerisy Custom Javascript-->