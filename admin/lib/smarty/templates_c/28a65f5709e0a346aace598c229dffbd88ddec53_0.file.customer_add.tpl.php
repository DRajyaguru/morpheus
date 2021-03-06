<?php
/* Smarty version 4.1.0, created on 2022-03-29 07:05:44
  from 'C:\wamp64\www\morpheus\skin\admin\middle\customer\customer_add.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.1.0',
  'unifunc' => 'content_6242afc85fbfc4_52928732',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '28a65f5709e0a346aace598c229dffbd88ddec53' => 
    array (
      0 => 'C:\\wamp64\\www\\morpheus\\skin\\admin\\middle\\customer\\customer_add.tpl',
      1 => 1648537304,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6242afc85fbfc4_52928732 (Smarty_Internal_Template $_smarty_tpl) {
?><div id="kt_modal_add_customer" tabindex="-1" aria-hidden="true">
<div class="content d-flex flex-column flex-column-fluid" >
						<!--begin::Container-->
						<div class="container-xxl" id="kt_content_container">
							<!--begin::Form-->
							<form id="add_customer_form" class="form d-flex flex-column flex-lg-row">
								<input type="hidden" name="customer_id" class="customer_id" value="<?php echo $_smarty_tpl->tpl_vars['customer_list']->value['customer_id'];?>
" />
								<!--begin::Aside column-->
								<div class="d-flex flex-column gap-7 gap-lg-10 w-100 w-lg-300px mb-7 me-lg-10">
									<!--begin::Thumbnail settings-->
									<div class="card card-flush py-4">
										<!--begin::Card header-->
										<div class="card-header">
											<!--begin::Card title-->
											<div class="card-title">
												<h2>Credits</h2>
											</div>
											<!--end::Card title-->
										</div>
										<!--end::Card header-->
										<!--begin::Card body-->
										<div class="card-body text-center pt-0 fv-row">
											<!--begin::Image input-->
											<label class="form-label" style="font-size:30px">100</label>
											<!--end::Image input-->
											<!--begin::Description-->
											
											<!--end::Description-->
										</div>
										<div class="text-muted text-center fs-7"><u><a href="#">View Orders</a></u></div>
										<!--end::Card body-->
									</div>
									<!--end::Thumbnail settings-->
									<!--begin::Status-->
									<div class="card card-flush py-4">
										<div class="card-header">
											<!--begin::Card title-->
											<div class="card-title">
												<h2>Status</h2>
											</div>
											<!--end::Card title-->
										</div>
										<!--begin::Card body-->
										<div class="card-body pt-0">
											
											<!--end::Label-->
											<!--begin::Input-->
											<div class="form-check form-switch form-check-custom form-check-solid">
												<input class="form-check-input h-30px w-50px status" name="status" type="checkbox" <?php if ($_smarty_tpl->tpl_vars['customer_list']->value['status'] == 'N') {?>value="N"<?php } else { ?>value="Y" checked="checked"<?php }?> id="flexSwitchChecked" />
												<label class="form-check-label" for="flexSwitchChecked">
											</div>
										</div>
										<!--end::Card body-->
									</div>
									<!--end::Status-->
								</div>
								<!--end::Aside column-->
								<!--begin::Main column-->
								<div class="d-flex flex-column flex-row-fluid gap-7 gap-lg-10">
									<!--begin::Tab content-->
									<div class="tab-content">
										<!--begin::Tab pane-->
										<div class="tab-pane fade show active" id="kt_ecommerce_add_customer_general" role="tab-panel">
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
                                                        <div class="row g-9 mb-7">   
                                                            <div class="col-md-6 fv-row">
                                                                <!--begin::Label-->
                                                                <label class="required form-label">First Name</label>
                                                                <!--end::Label-->
                                                                <!--begin::Input-->
                                                                <input type="text" name="first_name" class="form-control mb-2 first_name" placeholder="First Name" value="<?php echo $_smarty_tpl->tpl_vars['customer_list']->value['first_name'];?>
" />
                                                                <!--end::Input-->
                                                                <!--begin::Description-->
                                                                <!--end::Description-->
                                                            </div>
                                                            <!--end::Input group-->
                                                            <!--begin::Input group-->
                                                            <div class="col-md-6 fv-row">
                                                                <!--begin::Label-->
                                                                <label class="required form-label">Last Name</label>
                                                                <!--end::Label-->
                                                                <!--begin::Input-->
                                                                <input type="text" name="last_name" class="form-control mb-2 last_name" placeholder="Last Name" value="<?php echo $_smarty_tpl->tpl_vars['customer_list']->value['last_name'];?>
" />
                                                                <!--end::Input-->
                                                                <!--begin::Description-->
                                                                <!--end::Description-->
                                                            </div>
                                                        </div>
														<!--end::Input group-->
														<!--begin::Input group-->
														<div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="required form-label">Email</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" name="email_id" class="form-control mb-2 email_id" placeholder="Email" value="<?php echo $_smarty_tpl->tpl_vars['customer_list']->value['email_id'];?>
" />
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
														<!--end::Input group-->
                                                        <!--begin::Input group-->
														<div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="required form-label">Password</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="password" name="password" class="form-control mb-2 password" placeholder="Password" value="<?php echo $_smarty_tpl->tpl_vars['customer_list']->value['password'];?>
" />
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
														<div class="fv-row">
															<!--begin::Label-->
															<label class="required form-label">Confirm Password</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="password" name="confirm_password" class="form-control mb-2 confirm_password" placeholder="Confirm Password" value="<?php echo $_smarty_tpl->tpl_vars['customer_list']->value['password'];?>
" />
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
														<!--end::Input group-->
                                                        
                                                    </div>
                                                </div>
                                                <div class="card card-flush py-4">
													<!--begin::Card header-->
													<div class="card-header">
														<div class="card-title">
															<h2>Contact Details</h2>
														</div>
													</div>
                                                    <div class="card-body pt-0">
                                                    <!--begin::Input group-->
														<div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="required form-label">Phone No.</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" name="phone_no" class="form-control mb-2 phone_no" placeholder="Phone Number" value="<?php echo $_smarty_tpl->tpl_vars['customer_list']->value['phone_no'];?>
" />
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
														<!--end::Input group-->
                                                        <div class="row g-9 mb-7">
                                                            <div class="col-md-6 fv-row">
                                                                <!--begin::Label-->
                                                                <label class="required form-label">Address 1</label>
                                                                <!--end::Label-->
                                                                <!--begin::Input-->
                                                                <input type="text" name="address1" class="form-control mb-2 address1" placeholder="Address 1" value="<?php echo $_smarty_tpl->tpl_vars['customer_list']->value['address1'];?>
" />
                                                                <!--end::Input-->
                                                                <!--begin::Description-->
                                                                <!--end::Description-->
                                                            </div>
                                                            <!--end::Input group-->
                                                            <div class="col-md-6 fv-row">
                                                                <!--begin::Label-->
                                                                <label class="required form-label">Address 2</label>
                                                                <!--end::Label-->
                                                                <!--begin::Input-->
                                                                <input type="text" name="address2" class="form-control mb-2 address2" placeholder="Address 2" value="<?php echo $_smarty_tpl->tpl_vars['customer_list']->value['address2'];?>
" />
                                                                <!--end::Input-->
                                                                <!--begin::Description-->
                                                                <!--end::Description-->
                                                            </div>
                                                        </div>
														<!--end::Input group-->
                                                        <div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="required form-label">City</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" name="city" class="form-control mb-2 city" placeholder="City" value="<?php echo $_smarty_tpl->tpl_vars['customer_list']->value['city'];?>
" />
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
														<!--end::Input group-->
                                                        <div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="required form-label">State</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" name="state" class="form-control mb-2 state" placeholder="State" value="<?php echo $_smarty_tpl->tpl_vars['customer_list']->value['state'];?>
" />
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
														<!--end::Input group-->
                                                        
                                                        <div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="required form-label">Country</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" name="country" class="form-control mb-2 country" placeholder="Country" value="<?php echo $_smarty_tpl->tpl_vars['customer_list']->value['country'];?>
" />
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
                                                        <!--end::Input group-->
                                                        <div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="required form-label">ZipCode</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" name="zipcode" class="form-control mb-2 zipcode" placeholder="Zip Code" value="<?php echo $_smarty_tpl->tpl_vars['customer_list']->value['zipcode'];?>
" />
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
														
														<!--end::Input group-->
                                                        <div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="form-label">Total Credits</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" name="total_credits" class="form-control mb-2 total_credits" placeholder="Total Credits" value="<?php echo $_smarty_tpl->tpl_vars['customer_list']->value['total_credits'];?>
" />
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
														<!--end::Input group-->
                                                        
													</div>
													<!--end::Card header-->
												</div>
												<!--end::General options-->
											</div>
										</div>
										<!--end::Tab pane-->
									</div>
									
									<!--end::Tab content-->
									<div class="d-flex justify-content-end">
										<!--begin::Button-->
										<a href="index.php?file=customer/customer_list" id="kt_ecommerce_add_customer_cancel" class="btn btn-light me-5" >Cancel</a>
										<!--end::Button-->
										<!--begin::Button-->
										<button type="submit" id="add_customer_submit" class="btn btn-primary" data-kt-users-modal-action="submit">
										
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
