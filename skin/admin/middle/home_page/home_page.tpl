<div id="kt_modal_home_page" tabindex="-1" aria-hidden="true">
<div class="content d-flex flex-column flex-column-fluid" >
						<!--begin::Container-->
						<div class="container-xxl" id="kt_content_container">
							<!--begin::Form-->
							<form id="home_page_form" class="form d-flex flex-column flex-lg-row">
								<input type="hidden" name="home_page_id" class="home_page_id" value="1" />
								<input type="hidden" name="img_name" class="img_name" value="{$home_page_data}" />
								<!--begin::Aside column-->
								
								<!--end::Aside column-->
								<!--begin::Main column-->
								<div class="d-flex flex-column flex-row-fluid gap-7 gap-lg-10">
									<!--begin::Tab content-->
									<div class="tab-content">
										<!--begin::Tab pane-->
										<div class="tab-pane fade show active" id="kt_home_page_general" role="tab-panel">
											<div class="d-flex flex-column gap-7 gap-lg-10">
												<!--begin::General options-->
									
												<div class="card card-flush py-4" id="home_page_data">
													<!--begin::Card header-->
													<div class="card-header">
														<div class="card-title">
															<h2>Home Page Changes</h2>
														</div>
													</div>
													<!--end::Card header-->
													<!--begin::Card body-->
													<div class="card-body pt-0">
														<!--begin::Input group-->
														<div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="form-label">Top Banner</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" name="top_banner" class="form-control mb-2 top_banner" placeholder="Top Banner URL" value="{$home_page_data.top_banner}" />
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
														<!--end::Input group-->
														<!--begin::Input group-->
														<div>
															<!--begin::Label-->
															<label class="form-label">Personlized Video Generator</label>
															<!--end::Label-->
															<!--begin::Editor-->
                                                            <div id="personlized_video_generator" name="personlized_video_generator" class="min-h-200px mb-7">{$home_page_data.personlized_video_generator}</div>
                                                            <!--end::Editor-->
                                                            <!--begin::Description-->
                                                            
															<!--end::Description-->
														</div>
														<!--end::Input group-->
														<!--begin::Input group-->
														<div>
															<!--begin::Label-->
															<label class="form-label">About Info</label>
															<!--end::Label-->
															<!--begin::Editor-->
                                                            <div id="about_info" name="about_info" class="min-h-200px mb-7">{$home_page_data.about_info}</div>
                                                            <!--end::Editor-->
                                                            <!--begin::Description-->
                                                            
															<!--end::Description-->
														</div>
														<!--end::Input group-->
														<!--begin::Input group-->
														<div class="mb-10 fv-row">
															<!--begin::Label-->
															<label class="form-label">Copyright</label>
															<!--end::Label-->
															<!--begin::Input-->
															<input type="text" name="copyright" class="form-control mb-2 copyright" placeholder="Copyright Text" value="{$home_page_data.copyright}" />
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
														</div>
														<!--end::Input group-->
														<!--begin::Input group-->
														<div class="mb-10 fv-row links">
															<!--begin::Label-->
															<label class="form-label link-header">Links</label>
																<a class="btn btn-primary link-btn" href="">
																<!--begin::Svg Icon | path: icons/duotune/arrows/arr075.svg-->
																<span class="svg-icon svg-icon-2">
																	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																		<rect opacity="0.5" x="11.364" y="20.364" width="16" height="2" rx="1" transform="rotate(-90 11.364 20.364)" fill="black"></rect>
																		<rect x="4.36396" y="11.364" width="16" height="2" rx="1" fill="black"></rect>
																	</svg>
																</span>
																<!--end::Svg Icon-->Add New Link
																</a>
															<!--end::Label-->
														</div>
															<!--begin::Input-->
															<div class="card-body pt-0 link-body">
																<div class="links_label">
																	<label class="form-label required">Name</label>
																	<label class="form-label link-url-label required">URL</label>
																	<label class="form-label link-status-label">Status</label>
																	<label class="form-label new-tab-label">Open in New Tab</label>
																</div>
																{foreach from=$links_data item=arr name=count}
																<div class="extra_fields_input">
																<input type="text" name="link_name[{$smarty.foreach.count.index}]" class="form-control mb-3 link_name" placeholder="Name"  value="{$arr.link_name}" />
																<input type="text" name="link_url[{$smarty.foreach.count.index}]" class="form-control mb-3 link_url_input" placeholder="URL" value="{$arr.link_url}"/>
																
																<input type="hidden" name="link_status_hidden[{$smarty.foreach.count.index}]" class="link_status" value="No"/>
																<input type="checkbox" name="link_status[{$smarty.foreach.count.index}]" class="link_status" {if $arr.link_status eq 'on'} checked="checked"{/if} />
																<input type="hidden" name="open_new_tab_hidden[{$smarty.foreach.count.index}]" class="open_new_tab" value="No" />
																<input type="checkbox" name="open_new_tab[{$smarty.foreach.count.index}]" class="open_new_tab" {if $arr.open_new_tab eq 'on'} checked="checked"{/if} />
																<a class="btn remove-btn" href="#">
																	<span class="svg-icon svg-icon-2">
																		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
																			<rect x="4.36396" y="10.364" width="16" height="2" rx="1" fill="black">
																			</rect>
																		</svg>
																	</span>
																</a>
																</div>
																{/foreach}
															</div>
															<!--end::Input-->
															<!--begin::Description-->
															<!--end::Description-->
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
										<a href="index.php?file=home_page/home_page" id="kt_home_page_cancel" class="btn btn-light me-5" >Cancel</a>
										<!--end::Button-->
										<!--begin::Button-->
										<button type="submit" id="home_page_submit" class="btn btn-primary" data-kt-users-modal-action="submit">
										
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