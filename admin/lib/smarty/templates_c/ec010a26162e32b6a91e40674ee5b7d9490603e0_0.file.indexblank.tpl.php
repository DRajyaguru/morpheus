<?php
/* Smarty version 4.1.0, created on 2022-03-25 04:27:26
  from 'C:\wamp64\www\morpheus\skin\admin\indexblank.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_623d44aead7809_13070106',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ec010a26162e32b6a91e40674ee5b7d9490603e0' => 
    array (
      0 => 'C:\\wamp64\\www\\morpheus\\skin\\admin\\indexblank.tpl',
      1 => 1646047684,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:assets/css/main_css.tpl' => 1,
    'file:assets/js/main_js.tpl' => 1,
  ),
),false)) {
function content_623d44aead7809_13070106 (Smarty_Internal_Template $_smarty_tpl) {
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
<body>
  <?php $_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['middle']->value, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
  <?php $_smarty_tpl->_subTemplateRender("file:assets/js/main_js.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
</body>
</html>

<?php }
}
