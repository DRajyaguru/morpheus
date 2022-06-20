<div id="kt_modal_add_company_details" tabindex="-1" aria-hidden="true">
<div class="content d-flex flex-column flex-column-fluid" >
						<!--begin::Container-->
						<div class="container-xxl" id="kt_content_container">
							<!--begin::Form-->
							<form id="company_details_form" class="form d-flex flex-column flex-lg-row" data-kt-redirect="index.php?file=company_details/company_detail">
								<input type="hidden" name="company_id" class="company_id" value="1" />
								<input type="hidden" name="img_name" class="img_name" value="{$company_data.company_logo}" />
								<!--begin::Aside column-->
								
								<!--end::Aside column-->
								<!--begin::Main column-->
								<div class="d-flex flex-column flex-row-fluid gap-7 gap-lg-10">
									<!--begin::Tab content-->
									<div class="tab-content">
										<!--begin::Tab pane-->
										<div class="tab-pane fade show active" id="kt_ecommerce_add_company_details_general" role="tab-panel">
											<div class="d-flex flex-column gap-7 gap-lg-10">
												<!--begin::General options-->
									
												<div class="card card-flush py-4" id="company_information">
													<!--begin::Card header-->
													<div class="card-header">
														<div class="card-title">
															<h2>Company Information</h2>
														</div>
													</div>
													<!--end::Card header-->
													<!--begin::Card body-->
													<div class="card-body pt-0">
														<!--begin::Input group-->
														<div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="form-label">Company Name</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" name="company_name" class="form-control mb-2 company_name" placeholder="Company Name" value="{$company_data.company_name}" />
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
														<!--end::Input group-->
                                                        
														<!--begin::Input group-->
														<div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="form-label">Company Details</label>
															<!--end::Label-->
															<!--begin::Editor-->                                              
                                                            <div id="add_company_details" name="add_company_details" class="min-h-200px mb-2">{$company_data.company_details}</div>
                                                            <!--end::Editor-->
                                                            <!--begin::Description-->
                                                            
															<!--end::Description-->
														</div>
														<!--end::Input group-->
                                                        <div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="form-label">Company Email Address</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" name="company_email" class="form-control mb-2 company_email" placeholder="Company Email" value="{$company_data.company_email}" />
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
														<!--end::Input group-->
                                                        <div class="mb-9 fv-row">
															<!--begin::Label-->
															<label class="form-label">Company logo</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="file" name="company_icon" id="company_icon" class="form-control mb-2 company_icon" accept=".png, .jpg, .jpeg" placeholder="Company Logo" />
															<div class="image-input-wrapper h-50px" {if $company_data.company_logo} style="background-image:url(../assets/uploads/company_details/{$company_data.company_logo});background-repeat:no-repeat" {/if}></div>
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
															<div class="text-muted fs-7"><b>Recommended height is 50px.</b> Only *.png, *.jpg and *.jpeg image files are accepted</div>
														</div>
														<!--end::Input group-->
                                                        <div class="mb-10">
															<!--begin::Label-->
															<label class="form-label">Company Address</label>
															<!--end::Label-->
															<!--begin::Editor-->                                              
                                                            <input type="text" name="company_address" class="form-control mb-2 company_address" placeholder="Company Address" value="{$company_data.company_address}" />
                                                            <!--end::Editor-->
                                                            <!--begin::Description-->
                                                            
															<!--end::Description-->
														</div>
                                                        <div class="fv-row">
															<!--begin::Label-->
															<label class="required form-label">Company Phone Number</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" name="company_phone_no" class="form-control mb-2 company_phone_no" placeholder="Company Phone Number" value="{$company_data.company_phone_no}" />
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
										<button type="submit" id="company_details_submit" class="btn btn-primary" data-kt-users-modal-action="submit">
										
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
</div>