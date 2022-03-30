<?php
/* Smarty version 4.1.0, created on 2022-03-01 10:56:17
  from 'D:\wamp\www\morpheus\skin\admin\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_621dfbd1dc2a33_47941325',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd0f4ea2885c8cf27669924937d3f8788b55d32f7' => 
    array (
      0 => 'D:\\wamp\\www\\morpheus\\skin\\admin\\index.tpl',
      1 => 1646131979,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:assets/css/main_css.tpl' => 1,
    'file:assets/js/main_js.tpl' => 1,
  ),
),false)) {
function content_621dfbd1dc2a33_47941325 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><?php echo $_smarty_tpl->tpl_vars['title']->value;?>
</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="description" content=""> 
	<meta name="keywords" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php $_smarty_tpl->_subTemplateRender("file:assets/css/main_css.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
</head>
<body id="kt_body" class="header-fixed header-tablet-and-mobile-fixed aside-fixed aside-secondary-disabled">
 <!--begin::Main-->
 <!--begin::root-->
 <div class="d-flex flex-column flex-root">
  <!--begin::page-->
  <div class="page d-flex flex-row flex-column-fluid">
   <?php $_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['left']->value, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
    <!--begin::Wrapper-->
	 <div class="wrapper d-flex flex-column flex-row-fluid" id="kt_wrapper">
       <?php $_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['header']->value, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?> 
   	   <?php $_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['middle']->value, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
   	   <?php $_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['footer']->value, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
     </div>
    <!--end::Wrapper--> 
  </div> 
  <!--end::page-->
 </div>  
 <!--end::root-->  
   <?php $_smarty_tpl->_subTemplateRender("file:assets/js/main_js.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
</body>
</html><?php }
}
