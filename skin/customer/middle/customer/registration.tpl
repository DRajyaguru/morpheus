<section id="common-banner">
 <div class="common-bg-content">
  <div class="common-container">
   <h1>Registration</h1>
  </div>
 </div>
</section>
<section class="customer_profile_section">
 <form method="post" action="index.php?file=customer/registration" class="customer_register_form general_form_input" id="customer_register_form">
  <div class="container">
   <div class="row customer_profile_row ms-0 me-0"> 
    <div class="col-lg-6">
     <div class="row">
      <div class="col-lg-12">
       <h3>Access exclusive features with a free account</h3>
       <hr />
       <ul>
        <li><i class="bi bi-camera-video"></i><span>Generate a custom video with your personal information</span></li>
        <li><i class="bi bi-share"></i><span>Share Collections with anyone, anywhere</span></li>
        <li><i class="bi bi-download"></i><span>Try before you purchase with downloadable comps</span></li>
        <li><i class="bi bi-eye"></i><span>Easily keep track of your download and browsing history</span></li>
        <li><i class="bi"></i><span>Plus much more.</span></li>
       </ul>
      </div>
     </div>
    </div>
    <div class="col-lg-6">
     <div class="row">
      <div class="col-lg-12">
       <h3>Create your free account</h3>
       <hr />
      </div>
      <div class="col-md-6">
       <div class="form-group">
        <label for="First Name">First Name <span class="required">*</span></label>
        <input type="text" class="form-control" name="first_name" id="first_name">
       </div>
      </div>
      <div class="col-md-6">
       <div class="form-group">
        <label for="Last Name">Last Name <span class="required">*</span></label>
        <input type="text" class="form-control" name="last_name" id="last_name">
       </div>
      </div>
      <div class="col-md-12">
       <div class="form-group">
        <label for="Email">Email <span class="required">*</span></label>
        <input type="text" class="form-control" name="email_id" id="email_id">
       </div>
      </div>
      <div class="col-md-6">
       <div class="form-group">
        <label for="Password">Password <span class="required">*</span></label>
        <input type="password" class="form-control" name="password" id="password">
        <a href="#" class="show_password"><i class="bi bi-eye-slash"></i></a>
       </div>
      </div>
      <div class="col-md-6">
       <div class="form-group">
        <label for="Confirm Password">Confirm Password <span class="required">*</span></label>
        <input type="password" class="form-control" name="confirm_password" id="confirm_password">
       </div>
      </div>
      <div class="col-md-12 mb-3">
       <div class="form-group i_agree_terms"><input type="checkbox" name="agree_tick" class="agree_tick" value="Y" disabled="disabled" /><input type="hidden" name="accept_tc" class="accept_tc" /><span>To create an account, you first need to agree the Morpheus Website Terms & Conditions by <a href="#" data-bs-toggle="modal" data-bs-target="#termsconditionModal" class="click_modal"><u>Click Here</u></a>.</span></div>
      </div>
      <div class="col-md-12">
       <div class="form-group">
        <input type="submit" value="Get Started" name="btn_get_started" class="morpheus_btn btn btn-primary">
       </div>
      </div>
      <div class="col-md-12">
       <span class="or-separator">or</span>
       <span>Already have an account? <a href="index.php?file=customer/login" title="Login">Log in</a></span>
      </div>
     </div>
    </div> 
   </div>
  </div>
 </form>
 <div class="modal fade popup-modal" id="termsconditionModal" tabindex="-1" aria-labelledby="termsconditionModalTitle" aria-modal="true" role="dialog">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="termsconditionModalTitle">Terms & Conditions</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><i class="bi bi-x-lg"></i></button>
      </div>
      <div class="modal-body">
      <div class="webpage_description" id="termsconditionModalBody">{$description}</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn text-light btn-accept-tc" disabled="disabled">Accept</button>
      </div>
    </div>
  </div>
 </div>
</section>
