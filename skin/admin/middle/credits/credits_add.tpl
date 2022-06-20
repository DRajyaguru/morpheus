<!--begin::Content-->
<div class="content d-flex flex-column flex-column-fluid" >
    <!--begin::Container-->
    <div class="container-xxl" id="kt_content_container">
        <!--begin::Form-->
        <form id="add_credits_form" class="form d-flex flex-column flex-lg-row" data-kt-redirect="index.php?file=credits/credits_list">
            <input type="hidden" name="credits_id" class="credits_id" value="{$credits_list.credits_id}" />
            <!--begin::Aside column-->
            
            <!--end::Aside column-->
            <!--begin::Main column-->
            <div class="d-flex flex-column flex-row-fluid gap-7 gap-lg-10">
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
                                            <label class="required form-label">Package Name</label>
                                            <!--end::Label-->
                                            <!--begin::Input-->
                                            <input type="text" name="package_name" class="form-control mb-2 package_name" placeholder="Package Name" value="{$credits_list.package_name}" />
                                            <!--end::Input-->
                                        </div>
                                        <!--end::Input group-->
                                    <div class="row g-9 mb-7">
                                        <!--begin::Input group-->
                                        <div class="col-md-6 fv-row">
                                            <!--begin::Label-->
                                            <label class="required form-label">Credits</label>
                                            <!--end::Label-->
                                            <!--begin::Input-->
                                            <input type="text" name="credits" class="form-control mb-2 credits" placeholder="Credits" value="{$credits_list.credits}" />
                                            <!--end::Input-->
                                        </div>
                                    
                                    <!--end::Input group-->
                                    <!--begin::Input group-->
                                        <div class="col-md-6 fv-row">
                                            <!--begin::Label-->
                                            <label class="required form-label">Amount</label>
                                            <!--end::Label-->
                                            <!--begin::Input-->
                                            <input type="text" name="amount" class="form-control mb-2 amount" placeholder="Amount" value="{$credits_list.amount}" />
                                            <!--end::Input-->
                                        </div>
                                    <!--end::Input group-->
                                    </div>
                                    <!--begin::Input group-->
                                    <div class="mb-10">
                                        <!--begin::Label-->
                                        <label class="form-label">Description</label>
                                        <!--end::Label-->
                                        <!--begin::Editor-->                                              
                                        <div id="add_credits_description" name="add_credits_description" class="min-h-200px mb-2">{$credits_list.description}</div>
                                        <!--end::Editor-->
                                    </div>
                                    <div>
                                        <!--begin::Label-->
                                        <label class="fw-bold fs-6 mb-2">Status</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <div class="form-check form-switch form-check-custom form-check-solid">
                                        <input class="form-check-input h-30px w-50px status" name="status" type="checkbox" value="Y" id="flexSwitchChecked" checked="checked" />
                                        <label class="form-check-label" for="flexSwitchChecked"></label>
                                        </div>
                                        <!--end::Description-->
                                    </div>
                                    
                                    <!--end::Input group-->
                                    
                                </div>
                            </div>
                            <!--end::General options-->
                        
                
                <div class="d-flex justify-content-end">
                    <!--begin::Button-->
                    <a href="index.php?file=credits/credits_list" id="add_credits_cancel" class="btn btn-light me-5" >Cancel</a>
                    <!--end::Button-->
                    <!--begin::Button-->
                    <button type="submit" id="add_credits_submit" class="btn btn-primary">
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
<!--end::Content-->