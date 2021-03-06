<?php
/* Smarty version 4.1.0, created on 2022-03-28 05:12:38
  from 'C:\wamp64\www\morpheus\skin\admin\middle\webpage\webpage_add.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_624143c6d8d071_31407029',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '665b0d5f8fb0497fc2a466d539dbd3ceba1c238e' => 
    array (
      0 => 'C:\\wamp64\\www\\morpheus\\skin\\admin\\middle\\webpage\\webpage_add.tpl',
      1 => 1648203516,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_624143c6d8d071_31407029 (Smarty_Internal_Template $_smarty_tpl) {
?><div id="kt_modal_add_webpage" tabindex="-1" aria-hidden="true">
<div class="content d-flex flex-column flex-column-fluid" >
						<!--begin::Container-->
						<div class="container-xxl" id="kt_content_container">
							<!--begin::Form-->
							<form id="add_webpage_form" class="form d-flex flex-column flex-lg-row">
								<input type="hidden" name="webpage_id" class="webpage_id" value="<?php echo $_smarty_tpl->tpl_vars['webpage_list']->value['webpage_id'];?>
" />
								<!--begin::Aside column-->
								
								<!--end::Aside column-->
								<!--begin::Main column-->
								<div class="d-flex flex-column flex-row-fluid gap-7 gap-lg-10">
									<!--begin::Tab content-->
									<div class="tab-content">
										<!--begin::Tab pane-->
										<div class="tab-pane fade show active" id="kt_ecommerce_add_webpage_general" role="tab-panel">
											<div class="d-flex flex-column gap-7 gap-lg-10">
												<!--begin::General options-->
												<div class="card card-flush py-4">
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
															<label class="required form-label">Page Title</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" name="page_title" class="form-control mb-2 page_title" placeholder="Page title" value="<?php echo $_smarty_tpl->tpl_vars['webpage_list']->value['page_title'];?>
" />
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
														<!--end::Input group-->
                                                        
														<!--begin::Input group-->
														<div>
															<!--begin::Label-->
															<label class="form-label">Description</label>
															<!--end::Label-->
															<!--begin::Editor-->                                              
                                                            <div id="add_webpage_description" name="add_webpage_description" class="min-h-200px mb-2"><?php echo $_smarty_tpl->tpl_vars['webpage_list']->value['description'];?>
</div>
                                                            <!--end::Editor-->
                                                            <!--begin::Description-->
                                                            
															<!--end::Description-->
														</div>
														<!--end::Input group-->
                                                        <div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="required fw-bold fs-6 mb-2">Status</label>
                                                            <!--end::Label-->
                                                            <!--begin::Input-->
                                                            <div class="form-check form-switch form-check-custom form-check-solid">
                                                            <input class="form-check-input h-30px w-50px status" name="status" type="checkbox" value="Y" id="flexSwitchChecked" checked="checked"/>
                                                            <label class="form-check-label" for="flexSwitchChecked">
                                                            </div>
															<!--end::Description-->
														</div>
													</div>
													<!--end::Card header-->
												</div>
												<!--end::General options-->
												<!--begin::SEO-->
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
															<label class="required fw-bold fs-6 mb-2">Clean URL</label>
                                                            <!--end::Label-->
                                                            <!--begin::Input-->
                                                            <input type="text" name="clean_url" class="form-control mb-2 clean_url" placeholder="Clean URL" value="<?php echo $_smarty_tpl->tpl_vars['webpage_list']->value['clean_url'];?>
" />
															<!--end::Description-->
														</div>

														<div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="form-label">Meta Tag Title</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" name="meta_title" class="form-control mb-2 meta_title" placeholder="Meta Tag Title" value="<?php echo $_smarty_tpl->tpl_vars['webpage_list']->value['meta_title'];?>
" />
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
                                                        
                                                        <div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="required fw-bold fs-6 mb-2">Meta Tag Description</label>
                                                            <!--end::Label-->
                                                            <!--begin::Input-->
                                                            <textarea name="meta_description" class="form-control form-control-solid mb-3 mb-lg-0 meta_description" placeholder="Meta Tag Description" "><?php echo $_smarty_tpl->tpl_vars['webpage_list']->value['meta_description'];?>
</textarea>
															<span class="countdown float-end">70 characters remaining.</span>
															<!--end::Description-->
														</div>
														<!--end::Input group-->
													</div>
												</div>
												<!--end::Pricing-->
											</div>
										</div>
										<!--end::Tab pane-->
									</div>
									
									<!--end::Tab content-->
									<div class="d-flex justify-content-end">
										<!--begin::Button-->
										<a href="index.php?file=webpage/webpage_list" id="kt_ecommerce_add_webpage_cancel" class="btn btn-light me-5" >Cancel</a>
										<!--end::Button-->
										<!--begin::Button-->
										<button type="submit" id="add_webpage_submit" class="btn btn-primary" data-kt-users-modal-action="submit">
										
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
</div><?php }
}
