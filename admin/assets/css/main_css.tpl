<!--begin::Fonts-->
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css"/>
<!--end::Fonts-->
{if $page eq 'admin' || $page eq 'dashboard' || $page eq 'category' || $page eq 'category_list'}
<!--begin::Page Vendor Stylesheets(used by this page)-->
<link href="assets/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
<!--end::Page Vendor Stylesheets-->
{/if}
{if $page eq 'dashboard'}
<!--begin::Page Vendor Stylesheets(used by this page)-->
<link href="assets/plugins/custom/vis-timeline/vis-timeline.bundle.css" rel="stylesheet" type="text/css" />
<!--end::Page Vendor Stylesheets-->
{/if}
<!--begin::Global Stylesheets Bundle(used by all pages)-->
<link href="assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/style.bundle.css" rel="stylesheet" type="text/css"/>
<!--end::Global Stylesheets Bundle-->
<!--begin::iClerisy Global Stylesheets Bundle(used by all pages)-->
<link href="assets/css/iclerisy_custom.css" rel="stylesheet" type="text/css"/>
<!--end::iClerisy Global Stylesheets Bundle(used by all pages)-->