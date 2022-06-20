<section id="common-banner">
 <div class="common-bg-content">
  <div class="common-container">
   <h1>Checkout</h1>
  </div>
 </div>
</section>
<section class="checkout_section">
 <form method="post" action="#" class="checkout_form general_form_input" id="checkout_form">
  <div class="container">
   <div class="row checkout_row ms-0 me-0"> 
    <div class="col-lg-7">
     <div class="row">
      <div class="col-lg-12">
       <h4>Order Billing information</h4>
       <hr>
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
       <div class="col-md-6">
        <div class="form-group">
         <label for="Email">Email <span class="required">*</span></label>
         <input type="text" class="form-control" name="email_id" id="email_id" value="{$smarty.session.customer_email}" readonly="readonly">
        </div>
       </div>
       <div class="col-md-6">
        <div class="form-group">
         <label for="Phone Number">Phone Number <span class="required">*</span></label>
         <input type="text" class="form-control" name="phone_no" id="phone_no">
        </div>
       </div>
       <div class="col-md-6">
        <div class="form-group">
         <label for="Address1">Address1 <span class="required">*</span></label>
         <input type="text" class="form-control" name="address1" id="address1">
        </div>
       </div>
       <div class="col-md-6">
        <div class="form-group">
         <label for="Address2">Address2</label>
         <input type="text" class="form-control" name="address2" id="address2">
        </div>
       </div>
       <div class="col-md-6">
        <div class="form-group">
         <label for="City">City <span class="required">*</span></label>
         <input type="text" class="form-control" name="city" id="city">
        </div>
       </div>
       <div class="col-md-6">
        <div class="form-group">
         <label for="State">State <span class="required">*</span></label>
         <input type="text" class="form-control" name="state" id="state">
        </div>
       </div>
       <div class="col-md-6">
        <div class="form-group">
         <label for="Country">Country <span class="required">*</span></label>
         <input type="text" class="form-control" name="country" id="country">
        </div>
       </div>
       <div class="col-md-6">
        <div class="form-group">
         <label for="ZipCode">ZipCode <span class="required">*</span></label>
         <input type="text" class="form-control" name="zipcode" id="zipcode">
        </div>
       </div>
       <div class="col-md-12">
        <div class="form-group">
         <label for="Notes">Notes </label>
         <textarea class="form-control" name="notes" rows="4"></textarea>
        </div>
       </div>
       <div class="col-lg-12 mt-4">
       <h4>Order Payment information</h4>
       <hr>
      </div>
      <div class="col-md-12">
       <div class="form-group">
         <label for="Credit Card">Credit Card Number <span class="required">*</span></label>
         <input type="text" class="form-control" name="credit_card" id="credit_card">
        </div>
      </div>
      <div class="col-md-3">
       <div class="form-group">
         <label for="Month">MM <span class="required">*</span></label>
         <input type="text" class="form-control" name="month" id="month">
        </div>
      </div>
      <div class="col-md-3">
       <div class="form-group">
         <label for="Year">YY <span class="required">*</span></label>
         <input type="text" class="form-control" name="year" id="year">
        </div>
      </div>
      <div class="col-md-6">
       <div class="form-group">
         <label for="Security code">Security code <span class="required">*</span></label>
         <input type="text" class="form-control" name="security_code" id="security_code">
        </div>
      </div>
      <div class="col-md-12">
       <div class="form-group">
         <input type="submit" value="Pay now" name="btn_payment" class="morpheus_btn btn-payment btn btn-primary mt-2">
        </div>
      </div>
     </div>
    </div>
    <div class="col-lg-4 offset-lg-1">
     <div class="row order-summery-row">
      <div class="col-lg-12">
       <h4>Order Details</h4>
       <a href="index.php?file=credit/credit_purchase" title="Change plan" class="fw-bold">Change plan</a>
       <input type="hidden" name="customer_id" class="customer_id" value="{$credits_info.customer_id}" />
       <hr>
      </div>
      {assign var='total_credit_item' value=$credits_details|@count}
      {foreach from=$credits_details item=list key=key}
       <div class="col-lg-12">
        <span>{if $total_credit_item neq 1}<a href="#" class="remove_credits" title="Remove Credits" id="{$credits_details[$key].credits_item}"><i class="bi bi-x-circle"></i></a>{/if}{$credits_details[$key].credits} Morpheus Token</span>
        <span class="credits_price"><span>{$smarty.const.CURRENCY}</span><span class="credit_amount">{$credits_details[$key].amount}</span></span>
        <hr>
       </div>
      {/foreach}
      <div class="col-lg-12">
       <h4>Total</h4>
       <h4 class="fw-bold final_total"><span>{$smarty.const.CURRENCY}</span><span class="credit_total_amount">{$credits_info.total_amount|number_format:2}</span></h4>
      </div>
     </div>
    </div> 
   </div>
  </div>
 </form>
</section>