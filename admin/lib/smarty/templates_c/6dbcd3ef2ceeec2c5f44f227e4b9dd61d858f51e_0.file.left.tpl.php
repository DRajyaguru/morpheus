<?php
/* Smarty version 4.1.0, created on 2022-03-29 08:32:45
  from 'C:\wamp64\www\morpheus\skin\admin\left\left.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_6242c42de21756_75270498',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '6dbcd3ef2ceeec2c5f44f227e4b9dd61d858f51e' => 
    array (
      0 => 'C:\\wamp64\\www\\morpheus\\skin\\admin\\left\\left.tpl',
      1 => 1648542758,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6242c42de21756_75270498 (Smarty_Internal_Template $_smarty_tpl) {
?><!--begin::Aside-->
<div id="kt_aside" class="aside bg-primary" data-kt-drawer="true" data-kt-drawer-name="aside" data-kt-drawer-activate="{default: true, lg: false}" data-kt-drawer-overlay="true" data-kt-drawer-width="auto" data-kt-drawer-direction="start" data-kt-drawer-toggle="#kt_aside_toggle">
    <!--begin::Logo-->
    <div class="aside-logo d-none d-lg-flex flex-column align-items-center flex-column-auto py-8" id="kt_aside_logo">
        <a href="#">
            <img alt="Logo" src="assets/images/logo.png" class="h-55px" />
        </a>
    </div>
    <!--end::Logo-->
    <!--begin::Nav-->
    <div class="aside-nav d-flex flex-column align-lg-center flex-column-fluid w-100 pt-5 pt-lg-0" id="kt_aside_nav">
        <!--begin::Primary menu-->
        <div id="kt_aside_menu" class="menu menu-column menu-title-gray-600 menu-state-primary menu-state-icon-primary menu-state-bullet-primary menu-arrow-gray-500 fw-bold fs-6" data-kt-menu="true">
            <div data-kt-menu-trigger="click" data-kt-menu-placement="right-start" class="menu-item here py-3<?php if ($_smarty_tpl->tpl_vars['active_page']->value == 'dashboard') {?> show<?php }?>">
                <span class="menu-link menu-center" title="Dashboards" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-dismiss="click" data-bs-placement="right">
                    <span class="menu-icon me-0">
                        <i class="bi bi-bar-chart-line fs-2"></i>
                    </span>
                </span>
                <div class="menu-sub menu-sub-dropdown w-225px w-lg-275px px-1 py-4">
                    <div class="menu-item">
                        <a class="menu-link" href="index.php?file=dashboard/list">
                            <span class="menu-bullet">
                                <span class="bullet bullet-dot"></span>
                            </span>
                            <span class="menu-title">Dashboard</span>
                        </a>
                    </div>
                </div>
            </div>
            <div data-kt-menu-trigger="click" data-kt-menu-placement="right-start" class="menu-item py-3<?php if ($_smarty_tpl->tpl_vars['active_page']->value == 'users') {?> show<?php }?>">
                <span class="menu-link menu-center" title="Users" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-dismiss="click" data-bs-placement="right">
                    <span class="menu-icon me-0">
                        <i class="bi bi-people fs-2"></i>
                    </span>
                </span>
                <div class="menu-sub menu-sub-dropdown w-225px w-lg-275px px-1 py-4">
                    <div class="menu-item">
                        <a class="menu-link" href="index.php?file=admin/admin_list">
                            <span class="menu-bullet">
                                <span class="bullet bullet-dot"></span>
                            </span>
                            <span class="menu-title">Admin</span>
                        </a>
                    </div>
                    <div data-kt-menu-trigger="click" class="menu-item menu-accordion">
                        <span class="menu-link">
                            <span class="menu-bullet">
                                <span class="bullet bullet-dot"></span>
                            </span>
                            <span class="menu-title">Customer</span>
                            <span class="menu-arrow"></span>
                        </span>
                        <div class="menu-sub menu-sub-accordion">
                            <div class="menu-item">
                                <a class="menu-link" href="index.php?file=customer/customer_add">
                                    <span class="menu-bullet">
                                        <span class="bullet bullet-dot"></span>
                                    </span>
                                    <span class="menu-title">Add Customer</span>
                                </a>
                            </div>
                            <div class="menu-item">
                                <a class="menu-link" href="index.php?file=customer/customer_list">
                                    <span class="menu-bullet">
                                        <span class="bullet bullet-dot"></span>
                                    </span>
                                    <span class="menu-title">List Customer</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            <div data-kt-menu-trigger="click" data-kt-menu-placement="right-start" class="menu-item py-3<?php if ($_smarty_tpl->tpl_vars['active_page']->value == 'inventory') {?> show<?php }?>">
                <span class="menu-link menu-center" title="Inventory" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-dismiss="click" data-bs-placement="right">
                    <span class="menu-icon me-0">
                        <i class="bi bi-camera-video fs-2"></i>
                    </span>
                </span>
                <div class="menu-sub menu-sub-dropdown w-225px w-lg-275px px-1 py-4">
                    <div data-kt-menu-trigger="click" class="menu-item menu-accordion">
                        <span class="menu-link">
                            <span class="menu-bullet">
                                <span class="bullet bullet-dot"></span>
                            </span>
                            <span class="menu-title">Category</span>
                            <span class="menu-arrow"></span>
                        </span>
                        <div class="menu-sub menu-sub-accordion">
                            <div class="menu-item">
                                <a class="menu-link" href="index.php?file=category/category_add">
                                    <span class="menu-bullet">
                                        <span class="bullet bullet-dot"></span>
                                    </span>
                                    <span class="menu-title">Add Category</span>
                                </a>
                            </div>
                            <div class="menu-item">
                                <a class="menu-link" href="index.php?file=category/category_list">
                                    <span class="menu-bullet">
                                        <span class="bullet bullet-dot"></span>
                                    </span>
                                    <span class="menu-title">List Category</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div data-kt-menu-trigger="click" class="menu-item menu-accordion">
                        <span class="menu-link">
                            <span class="menu-bullet">
                                <span class="bullet bullet-dot"></span>
                            </span>
                            <span class="menu-title">Product</span>
                            <span class="menu-arrow"></span>
                        </span>
                        <div class="menu-sub menu-sub-accordion">
                            <div class="menu-item">
                                <a class="menu-link" href="index.php?file=product/product_add">
                                    <span class="menu-bullet">
                                        <span class="bullet bullet-dot"></span>
                                    </span>
                                    <span class="menu-title">Add Product</span>
                                </a>
                            </div>
                            <div class="menu-item">
                                <a class="menu-link" href="index.php?file=product/product_list">
                                    <span class="menu-bullet">
                                        <span class="bullet bullet-dot"></span>
                                    </span>
                                    <span class="menu-title">List Product</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div data-kt-menu-trigger="click" data-kt-menu-placement="right-start" class="menu-item py-3<?php if ($_smarty_tpl->tpl_vars['active_page']->value == 'webpage') {?> show<?php }?>">
                <span class="menu-link menu-center" title="webpage" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-dismiss="click" data-bs-placement="right">
                    <span class="menu-icon me-0">
                        <i class="bi bi-layout-text-window fs-2"></i>
                    </span>
                </span>
                <div class="menu-sub menu-sub-dropdown w-225px w-lg-275px px-1 py-4">
                    <div data-kt-menu-trigger="click" class="menu-item menu-accordion">
                        <span class="menu-link">
                            <span class="menu-bullet">
                                <span class="bullet bullet-dot"></span>
                            </span>
                            <span class="menu-title">webpage</span>
                            <span class="menu-arrow"></span>
                        </span>
                        <div class="menu-sub menu-sub-accordion">
                            <div class="menu-item">
                                <a class="menu-link" href="index.php?file=webpage/webpage_add">
                                    <span class="menu-bullet">
                                        <span class="bullet bullet-dot"></span>
                                    </span>
                                    <span class="menu-title">Add Webpage</span>
                                </a>
                            </div>
                            <div class="menu-item">
                                <a class="menu-link" href="index.php?file=webpage/webpage_list">
                                    <span class="menu-bullet">
                                        <span class="bullet bullet-dot"></span>
                                    </span>
                                    <span class="menu-title">List Webpage</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div data-kt-menu-trigger="click" data-kt-menu-placement="right-start" class="menu-item py-3<?php if ($_smarty_tpl->tpl_vars['active_page']->value == 'credits') {?> show<?php }?>">
                <span class="menu-link menu-center" title="Credits" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-dismiss="click" data-bs-placement="right">
                    <span class="menu-icon me-0">
                        <i class="bi bi-currency-dollar fs-2"></i>
                    </span>
                </span>
                <div class="menu-sub menu-sub-dropdown w-225px w-lg-275px px-1 py-4">
                    <div data-kt-menu-trigger="click" class="menu-item menu-accordion">
                        <span class="menu-link">
                            <span class="menu-bullet">
                                <span class="bullet bullet-dot"></span>
                            </span>
                            <span class="menu-title">Credits</span>
                            <span class="menu-arrow"></span>
                        </span>
                        <div class="menu-sub menu-sub-accordion">
                            <div class="menu-item">
                                <a class="menu-link" href="index.php?file=credits/credits_add">
                                    <span class="menu-bullet">
                                        <span class="bullet bullet-dot"></span>
                                    </span>
                                    <span class="menu-title">Add Credits</span>
                                </a>
                            </div>
                            <div class="menu-item">
                                <a class="menu-link" href="index.php?file=credits/credits_list">
                                    <span class="menu-bullet">
                                        <span class="bullet bullet-dot"></span>
                                    </span>
                                    <span class="menu-title">List Credits</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--end::Primary menu-->
    </div>
    <!--end::Nav-->
</div>
<!--end::Aside--><?php }
}
