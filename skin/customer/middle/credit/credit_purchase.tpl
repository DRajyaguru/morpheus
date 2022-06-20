<section id="common-banner">
 <div class="common-bg-content">
  <div class="common-container">
   <h1>Credit Packs</h1>
  </div>
 </div>
</section>
<section class="credits_list">
 <div class="container">
  <div class="row row-cols-2 row-cols-sm-2 row-cols-md-3 row-cols-lg-4">
   {section name=list loop=$credits_data}
    {if $smarty.section.list.first} 
     {assign var='credits' value={$credits_data[list].credits}}
     {assign var='amount' value={$credits_data[list].amount}}
    {/if}
    {$total_amount = $amount * $credits_data[list].credits / $credits }
    {$total_save = $total_amount - $credits_data[list].amount}
    <div class="col credit-box">
     <div class="credit-info text-center">
      <h2 class="credit-amount"><img src="assets/img/token.png"> {$credits_data[list].credits}</h2>
      <span>Morpheus Token</span>
      <h5 class="credit-purchase-amount mt-4">${$credits_data[list].amount}</h5>
      {if !$smarty.section.list.first}<span class="mb-4">Save ${$total_save}</span>{/if}
      <form method="post" action="index.php?file=purchase/checkout">
       <input type="hidden" name="action" value="add" />
       <input type="hidden" name="credits_id" value="{$credits_data[list].credits_id}" />
       <input type="hidden" name="credits" value="{$credits_data[list].credits}" />
       <input type="hidden" name="amount" value="{$credits_data[list].amount}" />
       <input type="submit" value="Purchase" name="btn_purchase" class="btn-purchase btn btn-primary">
      </form>
     </div>
    </div>
   {/section} 
  </div>
 </div>
</section>