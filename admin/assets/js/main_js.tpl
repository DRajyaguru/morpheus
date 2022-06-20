<!--begin::Global Javascript Bundle(used by all pages)-->
<script src="assets/plugins/global/plugins.bundle.js" type="text/javascript"></script>
<script src="assets/js/scripts.bundle.js" type="text/javascript"></script>
<!--end::Global Javascript Bundle-->
{if $page neq 'login'}
<!--begin::Page Vendors Javascript(used by this page)-->
<script src="assets/plugins/custom/datatables/datatables.bundle.js"></script>
<!--end::Page Vendors Javascript-->
{/if}
{if $page_js_name neq ''}
<!--begin::Page Vendors Javascript(used by this page)-->
<script src="assets/js/custom/apps/{$page_js_folder}/{$page_js_name}.js" type="text/javascript"></script>
<!--end::Page Vendors Javascript-->
{/if}
{if $page eq 'admin'}
<!--begin::Page Custom Javascript(used by this page)-->
<script src="assets/js/custom/apps/admin/admins.js"></script>
<script src="assets/js/custom/apps/admin/save-admin.js"></script>
<!--end::Page Custom Javascript-->
{/if}
{if $page neq 'login'}
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