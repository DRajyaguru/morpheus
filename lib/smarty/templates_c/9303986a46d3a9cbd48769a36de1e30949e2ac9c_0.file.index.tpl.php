<?php
/* Smarty version 4.1.0, created on 2022-02-28 11:17:35
  from 'D:\wamp\www\morpheus\skin\customer\index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_621caf4fbaeb01_02352947',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '9303986a46d3a9cbd48769a36de1e30949e2ac9c' => 
    array (
      0 => 'D:\\wamp\\www\\morpheus\\skin\\customer\\index.tpl',
      1 => 1646033913,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_621caf4fbaeb01_02352947 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><?php echo $_smarty_tpl->tpl_vars['title']->value;?>
</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="description" content=""> 
	<meta name="keywords" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
 	<?php $_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['top']->value, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
 	<?php $_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['middle']->value, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
 	<?php $_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['bottom']->value, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
</body>
</html><?php }
}
