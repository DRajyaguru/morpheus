<!--begin::Content-->
<div class="content d-flex flex-column flex-column-fluid" >
    <!--begin::Container-->
    <div class="container-xxl" id="kt_content_container">
        <!--begin::Form-->
        <form id="add_webpage_form" class="form d-flex flex-column flex-lg-row" data-kt-redirect="index.php?file=webpage/webpage_list">
            <input type="hidden" name="webpage_id" class="webpage_id" value="{$webpage_list.webpage_id}" />
            <input type="hidden" name="img_name" class="img_name" value="{$webpage_list.banner_img}" />
            <!--begin::Main column-->
            <div class="d-flex flex-column flex-row-fluid gap-7 gap-lg-10">
                <!--begin::Tab content-->
                <div class="tab-content">
                    <!--begin::Tab pane-->
                    <div class="tab-pane fade show active" id="add_webpage_general" role="tab-panel">
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
                                        <input type="text" name="page_title" class="form-control mb-2 page_title" placeholder="Page title" value="{$webpage_list.page_title}" />
                                        <!--end::Input-->
                                    </div>
                                    <!--end::Input group-->
                                    <!--begin::Input group-->
                                    <div class="mb-10">
                                        <!--begin::Label-->
                                        <label class="form-label">Description</label>
                                        <!--end::Label-->
                                        <!--begin::Editor-->                                              
                                        <div id="add_webpage_description" name="add_webpage_description" class="min-h-200px mb-2">{$webpage_list.description}</div>
                                        <!--end::Editor-->
                                    </div>
                                    <!--end::Input group-->
                                    <div>
                                        <!--begin::Label-->
                                        <label class="fw-bold fs-6 mb-2">Status</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <div class="form-check form-switch form-check-custom form-check-solid">
                                            <input class="form-check-input h-30px w-50px status" name="status" type="checkbox" value="Y" id="flexSwitchChecked" checked="checked"/>
                                            <label class="form-check-label" for="flexSwitchChecked"></label>
                                        </div>
                                        <!--end::Description-->
                                    </div>
                                </div>
                                <!--end::Card header-->
                            </div>
                            <!--end::General options-->
                            <div class="card card-flush py-4">
                    <!--begin::Card header-->
                    <div class="card-header">
                        <!--begin::Card title-->
                        <div class="card-title">
                            <h2>Top Banner</h2>
                        </div>
                        <!--end::Card title-->
                    </div>
                    <!--end::Card header-->
                    <!--begin::Card body-->
                    <div class="card-body pt-0 fv-row banner_image" id="image_upload">
                        <!--begin::Image input-->
                        <div class="image-input {if $webpage_list.banner_img neq ''}image-input-changed{else}image-input-empty{/if} image-input-outline mb-3" data-kt-image-input="true" style="background-image: url(assets/images/blank-image.svg)">
                            <!--begin::Preview existing avatar-->
                            <div class="image-input-wrapper w-150px h-150px" {if $webpage_list.banner_img} style="background-image:url(../assets/uploads/webpage/{$webpage_list.banner_img})" {/if}></div>
                            <!--end::Preview existing avatar-->
                            <!--begin::Label-->
                            <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow btn-change-icon" data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change icon">
                                <!--begin::Icon-->
                                <i class="bi bi-pencil-fill fs-7"></i>
                                <!--end::Icon-->
                                <!--begin::Inputs-->
                                <input type="file" name="banner_icon" id="banner_icon" accept=".png, .jpg, .jpeg" />
                                <input type="hidden" name="avatar_remove" />
                                <!--end::Inputs-->
                            </label>
                            <!--end::Label-->
                            <!--begin::Cancel-->
                            <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow btn-cancel-icon" data-kt-image-input-action="cancel" data-bs-toggle="tooltip" title="Cancel icon">
                                <i class="bi bi-x fs-2"></i>
                            </span>
                            <!--end::Cancel-->
                            <!--begin::Remove-->
                            <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="remove" data-bs-toggle="tooltip" title="Remove icon">
                                <i class="bi bi-x fs-2"></i>
                            </span>
                            <!--end::Remove-->
                        </div>
                        <!--end::Image input-->
                        <!--begin::Description-->
                        <div class="text-muted fs-7">Recommended resolution 1366x608. Only *.png, *.jpg and *.jpeg image files are accepted</div>
                        <!--end::Description-->
                    </div>
                    <!--end::Card body-->
                </div>
                <!--end::Thumbnail settings-->
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
                                        <input type="text" name="clean_url" class="form-control mb-2 clean_url" placeholder="Clean URL" value="{$webpage_list.clean_url}" />
                                        <!--end::Description-->
                                    </div>

                                    <div class="mb-10">
                                        <!--begin::Label-->
                                        <label class="form-label">Meta Tag Title</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <input type="text" name="meta_title" class="form-control mb-2 meta_title" placeholder="Meta Tag Title" value="{$webpage_list.meta_title}" />
                                        <!--end::Input-->
                                    </div>
                                    
                                    <div class="fv-row">
                                        <!--begin::Label-->
                                        <label class="fw-bold fs-6 mb-2">Meta Tag Description</label>
                                        <!--end::Label-->
                                        <!--begin::Input-->
                                        <textarea name="meta_description" class="form-control form-control-solid mb-3 mb-lg-0 meta_description" placeholder="Meta Tag Description" rows="4">{$webpage_list.meta_description}</textarea>
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
                    <a href="index.php?file=webpage/webpage_list" id="add_webpage_cancel" class="btn btn-light me-5" >Cancel</a>
                    <!--end::Button-->
                    <!--begin::Button-->
                    <button type="submit" id="add_webpage_submit" class="btn btn-primary">
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