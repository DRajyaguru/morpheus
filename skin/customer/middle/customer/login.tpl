<section id="common-banner">
 <div class="common-bg-content">
  <div class="common-container">
   <h1>Login</h1>
  </div>
 </div>
</section>
<section class="customer_profile_section">
 <form method="post" action="index.php?file=customer/login" class="customer_login_form general_form_input" id="customer_login_form">
  <div class="container">
   <div class="row customer_profile_row justify-content-center ms-0 me-0"> 
    <div class="col-lg-5">
     <div class="row">
      <div class="col-md-12">
       <div class="form-group">
        <label for="Email">Email or Username <span class="required">*</span></label>
        <input type="text" class="form-control" name="email_id" id="email_id">
       </div>
      </div>
      <div class="col-md-12">
       <div class="form-group">
        <label for="Password">Password <span class="required">*</span></label>
        <input type="password" class="form-control" name="password" id="password">
        <a href="#" class="show_password"><i class="bi bi-eye-slash"></i></a>
       </div>
      </div>
      <div class="col-md-12">
       <div class="form-group">
        <input type="submit" value="Login" name="btn_login" class="morpheus_btn btn btn-primary">
       </div>
      </div>
      <div class="col-md-12">
       <span class="or-separator">or</span>
       <span>Don't have a free account yet? <a href="index.php?file=customer/registration" title="Register">Create your account</a></span>
      </div>
     </div>
    </div> 
   </div>
  </div>
 </form>
</section>
<input type="hidden" class="register_session" value="{$smarty.session.customer_register}"  />
{if $smarty.session.customer_register}
  <div class="toast" id="registerNotify">
    <div class="toast-header">
      <strong class="me-auto">Thanks for signing up!</strong>
      <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
    </div>
    <div class="toast-body">
      Congratulations! Your new account has been successfully created! You can access exclusive features after account approved by admin.
    </div>
  </div>
{/if}