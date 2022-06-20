<!--begin::Content-->
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
    <!--begin::Container-->
    <div class="container-xxl" id="kt_content_container">
        <!--begin::Form-->
        <form id="add_product_form" class="form d-flex flex-column flex-lg-row" enctype="multipart/form-data" data-kt-redirect="index.php?file=product/product_list">
            <input type="hidden" name="product_id" class="product_id" value="{$product_list.product_id}" />
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
                        <div class="image-input image-input-empty image-input-outline mb-3{if $product_list.product_img} image-input-changed{/if}" data-kt-image-input="true" style="background-image: url(assets/images/blank-image.svg)">
                            <!--begin::Preview existing avatar-->
                            <div class="image-input-wrapper w-150px h-150px video-thumb-image" {if $product_list.product_img} style="background-image:url(../assets/uploads/product/{$product_list.product_img})" {/if}></div>
                            <!--end::Preview existing avatar-->
                            <!--begin::Label-->
                            <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px" data-kt-image-input-action="change" data-bs-toggle="tooltip">
                                <!--begin::Inputs-->
                                <input type="file" name="product_img" id="product_img" accept=".png, .jpg, .jpeg" />
                                <input type="hidden" name="avatar_remove" />
                                <input type="hidden" name="video_img_url" value="" />
                                <!--end::Inputs-->
                            </label>
                            <!--end::Label-->
                            <!--begin::Cancel-->
                            <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow d-none" data-kt-image-input-action="cancel" data-bs-toggle="tooltip" title="Cancel image">
                                <i class="bi bi-x fs-2"></i>
                            </span>
                            <!--end::Cancel-->
                            <!--begin::Remove-->
                            <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow btn-remove-icon d-none" data-kt-image-input-action="remove" data-bs-toggle="tooltip" title="Remove image">
                                <i class="bi bi-x fs-2"></i>
                            </span>
                            <!--end::Remove-->
                        </div>
                        <!--end::Image input-->
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
                              <input class="form-check-input h-30px w-50px status" name="status" type="checkbox" {if $product_list.status eq 'N'}value="N"{else}value="Y" checked="checked"{/if} id="flexSwitchChecked" />
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
                    <div class="card-body pt-0 fv-row">
                        <!--begin::Input group-->
                        <!--begin::Label-->
                        <label class="form-label">Categories</label>
                        <!--end::Label-->
                        <!--begin::Select2-->
                        <select class="form-select mb-2" data-control="select2" data-placeholder="Select an option" data-allow-clear="true" multiple="multiple" name="select_category[]">
                          {section name=list loop=$category_list}
                            <option value="{$category_list[list].category_id}" {if in_array({$category_list[list].category_id}, $product_category_list)}selected="selected" {/if}>{$category_list[list].category_name}</option>
                          {/section}
                        </select>
                        <!--end::Select2-->
                        <!--begin::Description-->
                        <div class="text-muted fs-7 mb-7">Add product to a category.</div>
                        <!--end::Description-->
                        <!--end::Input group-->
                        <!--begin::Button-->
                        <a href="index.php?file=category/category_add" class="btn btn-light-primary btn-sm">
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
                                <input type="text" name="storyboard_id" class="form-control mb-2 storyboard_id" placeholder="Storyboard id" {if $smarty.get.axn eq 'edit'} value="{$product_list.storyboard_id}" readonly="readonly" {/if} />
                                <!--end::Input-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="mb-10 fv-row">
                                <!--begin::Label-->
                                <label class="required form-label">Video Name</label>
                                <!--end::Label-->
                                <!--begin::Input-->
                                <input type="text" name="video_name" class="form-control mb-2 video_name" placeholder="Video name" value="{$product_list.name}" />
                                <!--end::Input-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="mb-10 fv-row">
                                <!--begin::Label-->
                                <label class="required form-label">SKU</label>
                                <!--end::Label-->
                                <!--begin::Input-->
                                <input type="text" name="sku" class="form-control mb-2" placeholder="SKU Number" value="{$product_list.sku}" />
                                <!--end::Input-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="mb-10">
                                <!--begin::Label-->
                                <label class="form-label">Description</label>
                                <!--end::Label-->
                                <!--begin::Editor-->
                                <div id="add_product_description" name="add_product_description" class="min-h-200px mb-2">{$product_list.description}</div>
                                <!--end::Editor-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="mb-5 fv-row">
                                <!--begin::Label-->
                                <label class="form-label">Price</label>
                                <!--end::Label-->
                                <!--begin::Input-->
                                <input type="text" name="price" class="form-control mb-2" placeholder="Product price" value="{$product_list.price}" />
                                <!--end::Input-->
                            </div>
                            <!--end::Input group-->
                            <div class="mb-5 or-label">
                              <label>OR</label>
                            </div>
                            <!--begin::Input group-->
                            <div class="fv-row mb-10">
                                <!--begin::Label-->
                                <label class="form-label">Credits</label>
                                <!--end::Label-->
                                <!--begin::Input-->
                                <input type="text" name="credits" class="form-control mb-2" placeholder="Credits" value="{$product_list.credits}" />
                                <!--end::Input-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div>
                                <!--begin::Label-->
                                <label class="form-label">Static Video Previews</label>
                                <!--end::Label-->
                                <!--begin::Input-->
                                <input type="text" name="static_video_preview" class="form-control" placeholder="Video Link" value="{$product_list.static_video_link}" />
                                <!--end::Input-->
                            </div>
                            <!--end::Input group-->
                        </div>
                        <!--end::Card header-->
                    </div>
                    <!--end::General options-->
                    <!--begin::Extra fields section-->
                    <div class="card card-flush py-4" id="extra_fields_section">
                     <div class="card-header">
                      <div class="card-title">
                       <h2>Extra Fields</h2>
                      </div>
                     </div>
                     <div class="card-body pt-0">
                       <div class="d-flex justify-content-center d-none">
                          <div class="spinner-border" role="status">
                            <span class="sr-only">Loading...</span>
                          </div>
                        </div>
                       {if $smarty.get.axn eq 'edit'}
                        {assign "orignal_char" array('_', '-')}
						{assign "replace_char" array(' ', ' ')}
                        {assign var='flex_basis_100' value=''}
                        {section name=list loop=$product_extrafields_data}
                         <!--begin::Input group-->
                         <div class="extra_field_input{if !$smarty.section.list.last} mb-10{/if}">
                              <!--begin::Label-->
                              {if !$smarty.section.list.first} {$flex_basis_100 = ' flex-basis-100'} {/if}
                              <label class="form-label{$flex_basis_100}">{$product_extrafields_data[list].extra_field_name|replace:$orignal_char:$replace_char}</label>
                              {if $smarty.section.list.first}<label class="form-label label-name">Label</label><label class="form-label label-position">Position</label>{/if}
                              <!--end::Label-->
                              <!--begin::Input-->
                              <input type="text" name="{$product_extrafields_data[list].extra_field_name}" class="form-control" placeholder="{$product_extrafields_data[list].extra_field_name|replace:$orignal_char:$replace_char}" value="{$product_extrafields_data[list].extra_field_value}" readonly="readonly" />
                              <input type="text" name="label[{$product_extrafields_data[list].product_extra_fields_id}][extra_fields_label]" class="form-control input-label-name" value="{$product_extrafields_data[list].extra_field_label}" placeholder="{$product_extrafields_data[list].extra_field_name} Label" />
                              <input type="text" name="position[{$product_extrafields_data[list].product_extra_fields_id}][extra_fields_order]" class="form-control input-position" value="{$product_extrafields_data[list].display_order}" onkeyup=this.value=this.value.replace(/[^0-9]/g,"") maxlength="3" placeholder="Position" />
                              <!--end::Input-->
                         </div>
                         <!--end::Input group-->
                        {/section}
                       {/if} 
                     </div> 
                    </div>
                    <!--end::Extra fields section-->
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
                                <input type="text" class="form-control mb-2 clean_url" name="clean_url" placeholder="Clean URL" value="{$product_list.clean_url}" />
                            	<!--end::Editor-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="mb-10">
                                <!--begin::Label-->
                                <label class="form-label">Meta Tag Title</label>
                                <!--end::Label-->
                                <!--begin::Input-->
                            	<input type="text" class="form-control mb-2 meta_title" name="meta_title" placeholder="Meta tag title" value="{$product_list.meta_title}" />
                            	<!--end::Input-->
                            </div>
                            <!--end::Input group-->
                            <!--begin::Input group-->
                            <div class="fv-row">
                                <!--begin::Label-->
                                <label class="form-label">Meta Tag Description</label>
                                <!--end::Label-->
                                <!--begin::Editor-->
                            	<textarea class="form-control form-control-solid rounded-3 meta_description" name="meta_description" rows="4">{$product_list.meta_description}</textarea>
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
                    <a href="index.php?file=product/product_list" id="add_product_cancel" class="btn btn-light me-5">Cancel</a>
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
<!--end::Content-->