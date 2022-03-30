<?php
/* Smarty version 4.1.0, created on 2022-03-29 08:11:17
  from 'C:\wamp64\www\morpheus\admin\assets\js\main_js.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_6242bf25cc8364_41863421',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd4cc1aa3352c525f2a7faf0a21fd13d673229d2f' => 
    array (
      0 => 'C:\\wamp64\\www\\morpheus\\admin\\assets\\js\\main_js.tpl',
      1 => 1648541475,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6242bf25cc8364_41863421 (Smarty_Internal_Template $_smarty_tpl) {
?><!--begin::Global Javascript Bundle(used by all pages)-->
<?php echo '<script'; ?>
 src="assets/plugins/global/plugins.bundle.js" type="text/javascript"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="assets/js/scripts.bundle.js" type="text/javascript"><?php echo '</script'; ?>
>
<!--end::Global Javascript Bundle-->
<?php if ($_smarty_tpl->tpl_vars['page']->value == 'admin' || $_smarty_tpl->tpl_vars['page']->value == 'dashboard' || $_smarty_tpl->tpl_vars['page']->value == 'category' || $_smarty_tpl->tpl_vars['page']->value == 'category_list' || $_smarty_tpl->tpl_vars['page']->value == 'webpage' || $_smarty_tpl->tpl_vars['page']->value == 'webpage_list' || $_smarty_tpl->tpl_vars['page']->value == 'customer' || $_smarty_tpl->tpl_vars['page']->value == 'customer_list' || $_smarty_tpl->tpl_vars['page']->value == 'credits' || $_smarty_tpl->tpl_vars['page']->value == 'credits_list') {?>
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
<?php } elseif ($_smarty_tpl->tpl_vars['page']->value == 'webpage') {?>
<!--begin::Page Vendors Javascript(used by this page)-->
<?php echo '<script'; ?>
 src="assets/js/custom/apps/webpage/save-webpage.js" type="text/javascript"><?php echo '</script'; ?>
>
<!--end::Page Vendors Javascript-->
<?php } elseif ($_smarty_tpl->tpl_vars['page']->value == 'webpage_list') {?>
<!--begin::Page Vendors Javascript(used by this page)-->
<?php echo '<script'; ?>
 src="assets/js/custom/apps/webpage/webpage.js" type="text/javascript"><?php echo '</script'; ?>
>
<!--end::Page Vendors Javascript-->
<?php } elseif ($_smarty_tpl->tpl_vars['page']->value == 'customer') {?>
<!--begin::Page Vendors Javascript(used by this page)-->
<?php echo '<script'; ?>
 src="assets/js/custom/apps/customer/save-customer.js" type="text/javascript"><?php echo '</script'; ?>
>
<!--end::Page Vendors Javascript-->
<?php } elseif ($_smarty_tpl->tpl_vars['page']->value == 'customer_list') {?>
<!--begin::Page Vendors Javascript(used by this page)-->
<?php echo '<script'; ?>
 src="assets/js/custom/apps/customer/customer.js" type="text/javascript"><?php echo '</script'; ?>
>
<!--end::Page Vendors Javascript-->
<?php } elseif ($_smarty_tpl->tpl_vars['page']->value == 'credits') {?>
<!--begin::Page Vendors Javascript(used by this page)-->
<?php echo '<script'; ?>
 src="assets/js/custom/apps/credits/save-credits.js" type="text/javascript"><?php echo '</script'; ?>
>
<!--end::Page Vendors Javascript-->
<?php } elseif ($_smarty_tpl->tpl_vars['page']->value == 'credits_list') {?>
<!--begin::Page Vendors Javascript(used by this page)-->
<?php echo '<script'; ?>
 src="assets/js/custom/apps/credits/credits.js" type="text/javascript"><?php echo '</script'; ?>
>
<!--end::Page Vendors Javascript-->


<?php }
if ($_smarty_tpl->tpl_vars['page']->value == 'admin' || $_smarty_tpl->tpl_vars['page']->value == 'dashboard' || $_smarty_tpl->tpl_vars['page']->value == 'category' || $_smarty_tpl->tpl_vars['page']->value == 'category_list' || $_smarty_tpl->tpl_vars['page']->value == 'webpage' || $_smarty_tpl->tpl_vars['page']->value == 'webpage_list' || $_smarty_tpl->tpl_vars['page']->value == 'customer' || $_smarty_tpl->tpl_vars['page']->value == 'customer_list' || $_smarty_tpl->tpl_vars['page']->value == 'credits' || $_smarty_tpl->tpl_vars['page']->value == 'credits_list') {?>
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
