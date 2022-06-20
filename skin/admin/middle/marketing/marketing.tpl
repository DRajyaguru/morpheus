<div id="kt_modal_marketing" tabindex="-1" aria-hidden="true">
<div class="content d-flex flex-column flex-column-fluid" >
						<!--begin::Container-->
						<div class="container-xxl" id="kt_content_container">
							<!--begin::Form-->
							<form id="marketing_form" class="form d-flex flex-column flex-lg-row">
								<input type="hidden" name="market_id" class="market_id" value="1" />
									
								<!--begin::Aside column-->
								
								<!--end::Aside column-->
								<!--begin::Main column-->
								<div class="d-flex flex-column flex-row-fluid gap-7 gap-lg-10">
									<!--begin::Tab content-->
									<div class="tab-content">
										<!--begin::Tab pane-->
										<div class="tab-pane fade show active" id="kt_market_general" role="tab-panel">
											<div class="d-flex flex-column gap-7 gap-lg-10">
												<!--begin::General options-->
									
												<div class="card card-flush py-4" id="marketing_data">
													<!--begin::Card header-->
													<div class="card-header">
														<div class="card-title">
															<h2>SEO</h2>
														</div>
													</div>
													<!--end::Card header-->
													<!--begin::Card body-->
													<div class="card-body pt-0">
														<!--begin::Input group-->
														<div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="form-label required">Default Page Title</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" name="default_page_title" class="form-control mb-2 default_page_title" placeholder="Meta Tag Title" value="{$marketing_data.default_page_title}" />
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
														<!--end::Input group-->                                                        
														<!--begin::Input group-->
														<div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="form-label">Default Meta Description</label>
															<!--end::Label-->
															<!--begin::Input-->
															<textarea class="form-control form-control-solid rounded-3 default_meta_description" name="default_meta_description" placeholder="Meta Tag Description" rows="4">{$marketing_data.default_meta_description}</textarea>
															<span class="countdown float-end">70 charactors remainig</span>
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
														<!--end::Input group-->
														<!--begin::Input group-->
														<div>
															<!--begin::Label-->
															<label class="fw-bold fs-6 mb-2 required">SEO Clean URL</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" name="seo_clean_url" class="form-control mb-2 seo_clean_url" placeholder="SEO Clean URL" value="{$marketing_data.seo_clean_url}" />
															<!--end::Description-->
														</div>
														<!--end::Input group-->
														<!--end::Input group-->
													</div>
													<!--end::Card header-->
												</div>
												<!--end::General options-->	
												<div class="card card-flush py-4" id="marketing_data">
													<!--begin::Card header-->
													<div class="card-header">
														<div class="card-title">
															<h2>Analytics</h2>
														</div>
													</div>
													<!--end::Card header-->
													<!--begin::Card body-->
													<div class="card-body pt-0">
														<!--begin::Input group-->
														<div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="form-label">Google Analytics</label>
															<!--end::Label-->
															<!--begin::Input-->
															<textarea class="form-control form-control-solid rounded-3 google_analytics" name="google_analytics" placeholder="Google Analytics" rows="4">{$marketing_data.google_analytics}</textarea>
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
														<!--end::Input group-->
														<!--begin::Input group-->
														<div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="form-label">Facebook Pixel Code</label>
															<!--end::Label-->
															<!--begin::Input-->
															<textarea class="form-control form-control-solid rounded-3 facebook_pixel_code" name="facebook_pixel_code" placeholder="Facebook Pixel Code" rows="4">{$marketing_data.facebook_pixel_code}</textarea>
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
														<!--end::Input group-->
														<!--begin::Input group-->
														<div class="fv-row">
															<!--begin::Label-->
															<label class="form-label">Other</label>
															<!--end::Label-->
															<!--begin::Input-->
															<textarea class="form-control form-control-solid rounded-3 other" name="other" placeholder="Other" rows="4">{$marketing_data.other}</textarea>
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
										<a href="index.php?file=marketing/marketing" id="kt_marketing_cancel" class="btn btn-light me-5" >Cancel</a>
										<!--end::Button-->
										<!--begin::Button-->
										<button type="submit" id="marketing_submit" class="btn btn-primary" data-kt-users-modal-action="submit">
										
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