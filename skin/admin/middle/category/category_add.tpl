<!--begin::Content-->
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
    <!--begin::Container-->
    <div class="container-xxl" id="kt_content_container">
        <form id="add_category_form" class="form d-flex flex-column flex-lg-row" data-kt-redirect="index.php?file=category/category_list" enctype="multipart/form-data">
            <input type="hidden" name="category_id" class="category_id" value="{$category_list.category_id}" />
            <input type="hidden" name="img_name" class="img_name" value="{$category_list.category_img}" />
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
                    <div class="card-body text-center pt-0 fv-row" id="image_upload">
                        <!--begin::Image input-->
                        <div class="image-input {if $category_list.category_img neq ''}image-input-changed{else}image-input-empty{/if} image-input-outline mb-3" data-kt-image-input="true" style="background-image: url(assets/images/blank-image.svg)">
                            <!--begin::Preview existing avatar-->
                            <div class="image-input-wrapper w-150px h-150px" {if $category_list.category_img} style="background-image:url(../assets/uploads/category/{$category_list.category_img})" {/if}></div>
                            <!--end::Preview existing avatar-->
                            <!--begin::Label-->
                            <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow btn-change-icon" data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change icon">
                                <!--begin::Icon-->
                                <i class="bi bi-pencil-fill fs-7"></i>
                                <!--end::Icon-->
                                <!--begin::Inputs-->
                                <input type="file" name="category_icon" id="category_icon" accept=".png, .jpg, .jpeg" />
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
                        <div class="text-muted fs-7">Set the category thumbnail image. Only *.png, *.jpg and *.jpeg image files are accepted</div>
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
                              <input class="form-check-input h-30px w-50px status" name="status" type="checkbox" {if $category_list.status eq 'N'}value="N"{else}value="Y" checked="checked"{/if} id="flexSwitchChecked" />
                              <label class="form-check-label" for="flexSwitchChecked"></label>
                        </div>
                    </div>
                    <!--end::Card body-->
                </div>
                <!--end::Status-->
            </div>
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
                            <label class="required form-label">Category Name</label>
                            <!--end::Label-->
                            <!--begin::Input-->
                            <input type="text" name="category_name" class="form-control mb-2 category_name" placeholder="Category name" value="{$category_list.category_name}" />
                            <!--end::Input-->
                        </div>
                        <!--end::Input group-->
                        <!--begin::Input group-->
                        <div>
                            <!--begin::Label-->
                            <label class="form-label">Description</label>
                            <!--end::Label-->
                            <!--begin::Editor-->
                            <div id="add_category_description" name="add_category_description" class="min-h-200px mb-2">{$category_list.description}</div>
                            <!--end::Editor-->
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
                            <input type="text" class="form-control mb-2 clean_url" name="clean_url" placeholder="Clean URL" value="{$category_list.clean_url}" />
                            <!--end::Editor-->
                        </div>
                        <!--end::Input group--> 
                        <!--begin::Input group-->
                        <div class="mb-10">
                            <!--begin::Label-->
                            <label class="form-label">Meta Tag Title</label>
                            <!--end::Label-->
                            <!--begin::Input-->
                            <input type="text" class="form-control mb-2 meta_title" name="meta_title" placeholder="Meta tag title" value="{$category_list.meta_title}" />
                            <!--end::Input-->
                        </div>
                        <!--end::Input group-->
                        <!--begin::Input group-->
                        <div class="fv-row">
                            <!--begin::Label-->
                            <label class="form-label">Meta Tag Description</label>
                            <!--end::Label-->
                            <!--begin::Editor-->
                            <textarea class="form-control form-control-solid rounded-3 meta_description" name="meta_description" rows="4">{$category_list.meta_description}</textarea>
                            <span class="countdown float-end"></span>
                            <!--end::Editor-->
                        </div>
                        <!--end::Input group-->
                    </div>
                    <!--end::Card header-->
                </div>
                <!--end::Meta options-->
                <div class="d-flex justify-content-end">
                    <!--begin::Button-->
                    <a href="index.php?file=category/category_list" id="add_category_cancel" class="btn btn-light me-5">Cancel</a>
                    <!--end::Button-->
                    <!--begin::Button-->
                    <button type="submit" id="add_category_submit" class="btn btn-primary">
                        <span class="indicator-label">Save Changes</span>
                        <span class="indicator-progress">Please wait...
                        <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                    </button>
                    <!--end::Button-->
                </div>
            </div>
            <!--end::Main column-->
        </form>
    </div>
    <!--end::Container-->
</div>
<!--end::Content-->