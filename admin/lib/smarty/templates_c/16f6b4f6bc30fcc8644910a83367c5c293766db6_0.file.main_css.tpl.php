<?php
/* Smarty version 4.1.0, created on 2022-03-16 05:42:04
  from 'D:\wamp\www\morpheus\admin\assets\css\main_css.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_623178ac0c2175_04615958',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '16f6b4f6bc30fcc8644910a83367c5c293766db6' => 
    array (
      0 => 'D:\\wamp\\www\\morpheus\\admin\\assets\\css\\main_css.tpl',
      1 => 1647409317,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_623178ac0c2175_04615958 (Smarty_Internal_Template $_smarty_tpl) {
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
