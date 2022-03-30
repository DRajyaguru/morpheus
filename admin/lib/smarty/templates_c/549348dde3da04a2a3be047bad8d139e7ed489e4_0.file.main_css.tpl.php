<?php
/* Smarty version 4.1.0, created on 2022-03-24 10:50:29
  from 'C:\wamp64\www\morpheus\admin\assets\css\main_css.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_623c4cf5ded1f4_77066329',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '549348dde3da04a2a3be047bad8d139e7ed489e4' => 
    array (
      0 => 'C:\\wamp64\\www\\morpheus\\admin\\assets\\css\\main_css.tpl',
      1 => 1647409316,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_623c4cf5ded1f4_77066329 (Smarty_Internal_Template $_smarty_tpl) {
?><!--begin::Fonts-->
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css"/>
<!--end::Fonts-->
<?php if ($_smarty_tpl->tpl_vars['page']->value == 'admin' || $_smarty_tpl->tpl_vars['page']->value == 'dashboard' || $_smarty_tpl->tpl_vars['page']->value == 'category' || $_smarty_tpl->tpl_vars['page']->value == 'category_list') {?>
<!--begin::Page Vendor Stylesheets(used by this page)-->
<link href="assets/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
<!--end::Page Vendor Stylesheets-->
<?php }
if ($_smarty_tpl->tpl_vars['page']->value == 'dashboard') {?>
<!--begin::Page Vendor Stylesheets(used by this page)-->
<link href="assets/plugins/custom/vis-timeline/vis-timeline.bundle.css" rel="stylesheet" type="text/css" />
<!--end::Page Vendor Stylesheets-->
<?php }?>
<!--begin::Global Stylesheets Bundle(used by all pages)-->
<link href="assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/style.bundle.css" rel="stylesheet" type="text/css"/>
<!--end::Global Stylesheets Bundle-->
<!--begin::iClerisy Global Stylesheets Bundle(used by all pages)-->
<link href="assets/css/iclerisy_custom.css" rel="stylesheet" type="text/css"/>
<!--end::iClerisy Global Stylesheets Bundle(used by all pages)--><?php }
}
