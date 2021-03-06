<?php
/* Smarty version 4.1.0, created on 2022-03-23 08:28:56
  from 'D:\wamp\www\morpheus\skin\admin\middle\product\product_add.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_623ada481507d2_56662420',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '54ae0618887b8817691e1e97eab433c405f6a301' => 
    array (
      0 => 'D:\\wamp\\www\\morpheus\\skin\\admin\\middle\\product\\product_add.tpl',
      1 => 1648024133,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_623ada481507d2_56662420 (Smarty_Internal_Template $_smarty_tpl) {
?><!--begin::Content-->
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
    <!--begin::Container-->
    <div class="container-xxl" id="kt_content_container">
        <!--begin::Form-->
        <form id="add_product_form" class="form d-flex flex-column flex-lg-row" enctype="multipart/form-data">
            <!--begin::Aside column-->
            <div class="d-flex flex-column gap-7 gap-lg-10 w-100 w-lg-300px mb-7 me-lg-10">
                <!--begin::Thumbnail settings-->
                <div class="card card-flush py-4">
                    <!--begin::Card header-->
                    <div class="card-header">
                        <!--begin::Card title-->
                        <div class="card-title">
                            <h2>Thumbnail</h2>
                        </div>
                        <!--end::Card title-->
                    </div>
                    <!--end::Card header-->
                    <!--begin::Card body-->
                    <div class="card-body text-center pt-0 fv-row">
                        <!--begin::Image input-->
                        <div class="image-input image-input-empty image-input-outline mb-3" data-kt-image-input="true" style="background-image: url(assets/images/blank-image.svg)">
                            <!--begin::Preview existing avatar-->
                            <div class="image-input-wrapper w-150px h-150px"></div>
                            <!--end::Preview existing avatar-->
                            <!--begin::Label-->
                            <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change image">
                                <i class="bi bi-pencil-fill fs-7"></i>
                                <!--begin::Inputs-->
                                <input type="file" name="product_img" id="product_img" accept=".png, .jpg, .jpeg" />
                                <input type="hidden" name="avatar_remove" />
                                <!--end::Inputs-->
                            </label>
                            <!--end::Label-->
                            <!--begin::Cancel-->
                            <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="cancel" data-bs-toggle="tooltip" title="Cancel image">
                                <i class="bi bi-x fs-2"></i>
                            </span>
                            <!--end::Cancel-->
                            <!--begin::Remove-->
                            <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow btn-remove-icon" data-kt-image-input-action="remove" data-bs-toggle="tooltip" title="Remove image">
                                <i class="bi bi-x fs-2"></i>
                            </span>
                            <!--end::Remove-->
                        </div>
                        <!--end::Image input-->
                        <!--begin::Description-->
                        <div class="text-muted fs-7">Set the product thumbnail image. Only *.png, *.jpg and *.jpeg image files are accepted</div>
                        <!--end::Description-->
                    </div>
                    <!--end::Card body-->
                </div>
                <!--end::Thumbnail settings-->
                <!--begin::Status-->
                <div class="card card-flush py-4">
                    <!--begin::Card header-->
                    <div class="card-header">
                        <!--begin::Card title-->
                        <div class="card-title">
                            <h2>Status</h2>
                        </div>
                        <!--end::Card title-->
                    </div>
                    <!--end::Card header-->
                    <!--begin::Card body-->
                    <div class="card-body pt-0">
                        <div class="form-check form-switch form-check-custom form-check-solid">
                              <input class="form-check-input h-30px w-50px status" name="status" type="checkbox" value="Y" checked="checked" id="flexSwitchChecked" />
                              <label class="form-check-label" for="flexSwitchChecked"></label>
                        </div>
                    </div>
                    <!--end::Card body-->
                </div>
                <!--end::Status-->
                <!--begin::Category & tags-->
                <div class="card card-flush py-4">
                    <!--begin::Card header-->
                    <div class="card-header">
                        <!--begin::Card title-->
                        <div class="card-title">
                            <h2>Product Details</h2>
                        </div>
                        <!--end::Card title-->
                    </div>
                    <!--end::Card header-->
                    <!--begin::Card body-->
                    <div class="card-body pt-0">
                        <!--begin::Input group-->
                        <!--begin::Label-->
                        <label class="form-label">Categories</label>
                        <!--end::Label-->
                        <!--begin::Select2-->
                        <select class="form-select mb-2" data-control="select2" data-placeholder="Select an option" data-allow-clear="true" multiple="multiple" name="select_category[]">
                          <option></option>
                          <?php
$__section_list_0_loop = (is_array(@$_loop=$_smarty_tpl->tpl_vars['category_list']->value) ? count($_loop) : max(0, (int) $_loop));
$__section_list_0_total = $__section_list_0_loop;
$_smarty_tpl->tpl_vars['__smarty_section_list'] = new Smarty_Variable(array());
if ($__section_list_0_total !== 0) {
for ($__section_list_0_iteration = 1, $_smarty_tpl->tpl_vars['__smarty_section_list']->value['index'] = 0; $__section_list_0_iteration <= $__section_list_0_total; $__section_list_0_iteration++, $_smarty_tpl->tpl_vars['__smarty_section_list']->value['index']++){
?>
                            <option value="<?php echo $_smarty_tpl->tpl_vars['category_list']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_list']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_list']->value['index'] : null)]['category_id'];?>
"><?php echo $_smarty_tpl->tpl_vars['category_list']->value[(isset($_smarty_tpl->tpl_vars['__smarty_section_list']->value['index']) ? $_smarty_tpl->tpl_vars['__smarty_section_list']->value['index'] : null)]['category_name'];?>
</option>
                          <?php
}
}
?>
                        </select>
                        <!--end::Select2-->
                        <!--begin::Description-->
                        <div class="text-muted fs-7 mb-7">Add product to a category.</div>
                        <!--end::Description-->
                        <!--end::Input group-->
                        <!--begin::Button-->
                        <a href="index.php?file=category/category_add" class="btn btn-light-primary btn-sm mb-10">
                        <!--begin::Svg Icon | path: icons/duotune/arrows/arr087.svg-->
                        <span class="svg-icon svg-icon-2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                                <rect opacity="0.5" x="11" y="18" width="12" height="2" rx="1" transform="rotate(-90 11 18)" fill="black" />
                                <rect x="6" y="11" width="12" height="2" rx="1" fill="black" />
                            </svg>
                        </span>
                        <!--end::Svg Icon-->Create new category</a>
                        <!--end::Button-->
                    </div>
                    <!--end::Card body-->
                </div>
                <!--end::Category & tags-->
            </div>
            <!--end::Aside column-->
            <!--begin::Main column-->
            <div class="d-flex flex-column flex-row-fluid gap-7 gap-lg-10">
                <div class="d-flex flex-column gap-7 gap-lg-10">
                    <!--begin::General options-->
                    <div class="card card-flush py-4" id="general_section">
                        <!--begin::Card header-->
                        <div class="card-header">
                            <div class="card-title">
                                <h2>General</h2>
                            </div>
                        </div>
                        <!--end::Card header-->
                        <!--begin::Card body-->
                        <div class="card-body pt-0">
                            <!--begin::Input group-->
                            <div class="mb-10 fv-row">
                                <!--begin::Label-->
                                <label class="required form-label">Storyboard ID</label>
                                <!--end::Label-->
                                <!--begin::Input-->
                                <input type="text" name="storyboard_id" class="form-control mb-2 storyboard_id" placeholder="Storyboard id" value="" />
                                <!--end::Input-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="mb-10 fv-row">
                                <!--begin::Label-->
                                <label class="required form-label">Video Name</label>
                                <!--end::Label-->
                                <!--begin::Input-->
                                <input type="text" name="video_name" class="form-control mb-2 video_name" placeholder="Video name" value="" />
                                <!--end::Input-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="mb-10 fv-row">
                                <!--begin::Label-->
                                <label class="required form-label">SKU</label>
                                <!--end::Label-->
                                <!--begin::Input-->
                                <input type="text" name="sku" class="form-control mb-2" placeholder="SKU Number" value="" />
                                <!--end::Input-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="mb-10">
                                <!--begin::Label-->
                                <label class="form-label">Description</label>
                                <!--end::Label-->
                                <!--begin::Editor-->
                                <div id="add_product_description" name="add_product_description" class="min-h-200px mb-2"></div>
                                <!--end::Editor-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="mb-5">
                                <!--begin::Label-->
                                <label class="form-label">Price</label>
                                <!--end::Label-->
                                <!--begin::Input-->
                                <input type="text" name="price" class="form-control mb-2" placeholder="Product price" value="" />
                                <!--end::Input-->
                            </div>
                            <!--end::Input group-->
                            <div class="mb-5 or-label">
                              <label>OR</label>
                            </div>
                            <!--begin::Input group-->
                            <div>
                                <!--begin::Label-->
                                <label class="form-label">Credits</label>
                                <!--end::Label-->
                                <!--begin::Input-->
                                <input type="text" name="credits" class="form-control mb-2" placeholder="Credits" value="" />
                                <!--end::Input-->
                            </div>
                            <!--end::Input group-->
                        </div>
                        <!--end::Card header-->
                    </div>
                    <!--end::General options-->
                    <!--begin::Meta options-->
                    <div class="card card-flush py-4">
                        <!--begin::Card header-->
                        <div class="card-header">
                            <div class="card-title">
                                <h2>Meta Options</h2>
                            </div>
                        </div>
                        <!--end::Card header-->
                        <!--begin::Card body-->
                        <div class="card-body pt-0">
                            <!--begin::Input group-->
                            <div class="mb-10 fv-row">
                                <!--begin::Label-->
                                <label class="required form-label">Clean URL</label>
                                <!--end::Label-->
                                <!--begin::Editor-->
                                <input type="text" class="form-control mb-2 clean_url" name="clean_url" placeholder="Clean URL" value="" />
                            	<!--end::Editor-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="mb-10">
                                <!--begin::Label-->
                                <label class="form-label">Meta Tag Title</label>
                                <!--end::Label-->
                                <!--begin::Input-->
                            	<input type="text" class="form-control mb-2 meta_title" name="meta_title" placeholder="Meta tag title" value="" />
                            	<!--end::Input-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="fv-row">
                                <!--begin::Label-->
                                <label class="form-label">Meta Tag Description</label>
                                <!--end::Label-->
                                <!--begin::Editor-->
                            	<textarea class="form-control form-control-solid rounded-3 meta_description" name="meta_description" rows="4"></textarea>
                            	<span class="countdown float-end"></span>
                            	<!--end::Editor-->
                            </div>
                            <!--end::Input group-->
                        </div>
                        <!--end::Card header-->
                    </div>
                    <!--end::Meta options-->
                </div>
                <div class="d-flex justify-content-end">
                    <!--begin::Button-->
                    <a href="#" id="add_product_cancel" class="btn btn-light me-5">Cancel</a>
                    <!--end::Button-->
                    <!--begin::Button-->
                    <button type="submit" id="add_product_submit" class="btn btn-primary">
                        <span class="indicator-label">Save Changes</span>
                        <span class="indicator-progress">Please wait...
                        <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                    </button>
                    <!--end::Button-->
                </div>
            </div>
            <!--end::Main column-->
        </form>
        <!--end::Form-->
    </div>
    <!--end::Container-->
</div>
<!--end::Content--><?php }
}
