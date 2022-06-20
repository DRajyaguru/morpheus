<section id="common-banner">
 <div class="common-bg-content">
  <div class="common-container">
   <h1>Cart</h1>
  </div>
 </div>
</section>

<section class="cart_section">
 <div class="container">
   <div class="row cart_row ms-0 me-0"> 
    {if $video_details}
        <div class="col-lg-8 ps-0 pe-0">
         <div class="row">
          <div class="col-lg-12">
           <input type="hidden" name="customer_id" class="customer_id" value="{$cart_info.customer_id}" /> 
           {assign var='total_cart_item' value=$video_details|@count} 
           <h3 class="fw-bold">Your Cart (<span class="count-item">{$total_cart_item}</span> item{if $total_cart_item > 1}s{/if})</h3>
          </div> 
          <div class="col-lg-12 cart-video-details">
          {foreach from=$video_details item=list key=key}
           <div class="cart-video-info">
            <div class="video-img">
             <a href="index.php?file=product/product&product_id={$video_details[$key].product_id}"><img src="assets/uploads/product/{$video_details[$key].product_image}" /></a>
            </div>
            <div class="video-basic-info">
             <a href="index.php?file=product/product&product_id={$video_details[$key].product_id}">{$video_details[$key].product_name}</a>
             <span>{$video_details[$key].product_sku}</span>
             <form method="post" action="index.php?file=purchase/cart">
               <input type="hidden" name="action" value="remove" /> 
               <input type="hidden" name="customer_id" value="{$cart_info.customer_id}" /> 
               <input type="hidden" name="storyboard_id" value="{$video_details[$key].storyboard_id}" /> 
               <button type="submit" class="btn remove_items p-0"><i class="bi bi-trash"></i>Delete</button>
             </form>
             <!--<a href="#" class="remove_items" title="Remove Items" id="{$video_details[$key].storyboard_id}"><i class="bi bi-trash"></i>Delete</a>-->
            </div>
            <div class="video-credit-info">
              <span class="video-credit" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-bs-original-title="Morpheus Token"><img src="assets/img/token.png">{$video_details[$key].credits}</span>
              <span>Morpheus Token</span>
            </div>
           </div>
          {/foreach} 
          </div>
         </div>
        </div>
        <div class="col-lg-4 ps-lg-3 pe-0 ps-0">
         <div class="row">
          <div class="col-lg-12">
           <h3 class="fw-bold">Order Summery</h3>
          </div>
          <div class="col-lg-12">
          <div class="cart-total-details">
           <div class="total-clips">
             <i class="bi bi-play-circle"></i>
             <span class="fw-bold"><span class="count-item">{$total_cart_item}</span> video clip{if $total_cart_item > 1}s{/if}</span>
           </div>
           <div class="cart-order-summery">
            <div class="customer-credits">
             <span>Your Credits</span>
             <span><img src="assets/img/token.png"> {$customer_credits}</span> 
            </div>
            <div class="total-purchase-credits">
             <span>Purchase Credits</span>
             <span><img src="assets/img/token.png"> <span class="total-buy-credits">{$cart_info.total_credits}</span></span> 
            </div>
          </div>
          <!--<div class="cart-order-total">
           <span>Estimated amount due today</span>
           <span>$150</span> 
          </div>-->
          <div>
           <a href="index.php?file=purchase/checkout" class="morpheus_btn proceed-checkout btn-payment btn btn-primary mt-2">Proceed to checkout</a>
           <a href="{$smarty.const.ROOT_DIR_PATH}" class="continue-shopping">Continue Shopping</a>
          </div>
          </div>
         </div>
        </div>
       </div> 
    {else}
      <div class="text-center mt-0">
       <i class="bi bi-cart empty-cart"></i>
       <h3>Your cart is empty!</h3> 
       <span>Looks like you have no videos added in cart.</span>
      </div>
    {/if}
  </div>
 </div>
</section>
