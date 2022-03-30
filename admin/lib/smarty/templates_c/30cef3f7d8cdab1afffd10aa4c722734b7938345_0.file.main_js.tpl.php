<?php
/* Smarty version 4.1.0, created on 2022-03-17 06:13:08
  from 'D:\wamp\www\morpheus\admin\assets\js\main_js.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_6232d174b98a66_79237937',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '30cef3f7d8cdab1afffd10aa4c722734b7938345' => 
    array (
      0 => 'D:\\wamp\\www\\morpheus\\admin\\assets\\js\\main_js.tpl',
      1 => 1647497406,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6232d174b98a66_79237937 (Smarty_Internal_Template $_smarty_tpl) {
?><!--begin::Global Javascript Bundle(used by all pages)-->
<?php echo '<script'; ?>
 src="assets/plugins/global/plugins.bundle.js" type="text/javascript"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="assets/js/scripts.bundle.js" type="text/javascript"><?php echo '</script'; ?>
>
<!--end::Global Javascript Bundle-->
<?php if ($_smarty_tpl->tpl_vars['page']->value == 'admin' || $_smarty_tpl->tpl_vars['page']->value == 'dashboard' || $_smarty_tpl->tpl_vars['page']->value == 'category' || $_smarty_tpl->tpl_vars['page']->value == 'category_list') {?>
<!--begin::Page Vendors Javascript(used by this page)-->
<?php echo '<script'; ?>
 src="assets/plugins/custom/datatables/datatables.bundle.js"><?php echo '</script'; ?>
>
<!--end::Page Vendors Javascript-->
<?php }
if ($_smarty_tpl->tpl_vars['page']->value == 'login') {?>
<!--begin::Page Custom Javascript(used by this page)-->
<?php echo '<script'; ?>
 src="assets/js/custom/sign-in/general.js" type="text/javascript"><?php echo '</script'; ?>
>
<!--end::Page Custom Javascript-->
<?php } elseif ($_smarty_tpl->tpl_vars['page']->value == 'admin') {?>
<!--begin::Page Custom Javascript(used by this page)-->
<?php echo '<script'; ?>
 src="assets/js/custom/apps/admin-management/admins.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="assets/js/custom/apps/admin-management/save-admin.js"><?php echo '</script'; ?>
>
<!--end::Page Custom Javascript-->
<?php } elseif ($_smarty_tpl->tpl_vars['page']->value == 'dashboard') {?>
<!--begin::Page Vendors Javascript(used by this page)-->
<?php echo '<script'; ?>
 src="assets/plugins/custom/vis-timeline/vis-timeline.bundle.js" type="text/javascript"><?php echo '</script'; ?>
>
<!--end::Page Vendors Javascript-->
<?php } elseif ($_smarty_tpl->tpl_vars['page']->value == 'category') {?>
<!--begin::Page Vendors Javascript(used by this page)-->
<?php echo '<script'; ?>
 src="assets/js/custom/apps/ecommerce/catalog/categories/save-category.js" type="text/javascript"><?php echo '</script'; ?>
>
<!--end::Page Vendors Javascript-->
<?php } elseif ($_smarty_tpl->tpl_vars['page']->value == 'category_list') {?>
<!--begin::Page Vendors Javascript(used by this page)-->
<?php echo '<script'; ?>
 src="assets/js/custom/apps/ecommerce/catalog/categories/categories.js" type="text/javascript"><?php echo '</script'; ?>
>
<!--end::Page Vendors Javascript-->
<?php } elseif ($_smarty_tpl->tpl_vars['page']->value == 'product') {?>
<!--begin::Page Vendors Javascript(used by this page)-->
<?php echo '<script'; ?>
 src="assets/js/custom/apps/ecommerce/catalog/products/save-product.js" type="text/javascript"><?php echo '</script'; ?>
>
<!--end::Page Vendors Javascript-->
<?php } elseif ($_smarty_tpl->tpl_vars['page']->value == 'product_list') {?>
<!--begin::Page Vendors Javascript(used by this page)-->
<?php echo '<script'; ?>
 src="assets/js/custom/apps/ecommerce/catalog/products/products.js" type="text/javascript"><?php echo '</script'; ?>
>
<!--end::Page Vendors Javascript-->
<?php }
if ($_smarty_tpl->tpl_vars['page']->value == 'admin' || $_smarty_tpl->tpl_vars['page']->value == 'dashboard' || $_smarty_tpl->tpl_vars['page']->value == 'category' || $_smarty_tpl->tpl_vars['page']->value == 'category_list') {?>
<!--begin::Page Custom Javascript(used by this page)-->
<?php echo '<script'; ?>
 src="assets/js/widgets.bundle.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="assets/js/custom/widgets.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="assets/js/custom/apps/chat/chat.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="assets/js/custom/utilities/modals/upgrade-plan.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="assets/js/custom/utilities/modals/users-search.js"><?php echo '</script'; ?>
>
<!--end::Page Custom Javascript-->
<?php }?>
<!--begin::iClerisy Custom Javascript-->
<?php echo '<script'; ?>
 src="assets/js/iclerisy_custom.js" type="text/javascript"><?php echo '</script'; ?>
>
<!--end::iClerisy Custom Javascript--><?php }
}
