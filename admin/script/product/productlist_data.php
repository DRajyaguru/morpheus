<?php
include_once( '../../lib/ssp.class.php');
$tables  = array('product');
$fields  = array('p.product_id','p.name','p.sku','p.credits','p.product_img','p.display_order','p.status');
$keys    = array('product_id');
$alias   = array('p');

$columns = array(
	array('db' => 'product_id',		
	      'dt' => 0,
		  'formatter' => function($d,$row) {
			return '<div class="form-check form-check-sm form-check-custom form-check-solid"><input class="form-check-input all-checked" type="checkbox" value="'.$row['product_id'].'" /></div>';
		  }),
 
    array('db' => 'name',	
	      'dt' => 1,
		  'formatter' => function( $d, $row ) {
		  	return '<div class="d-flex align-items-center"><a href="#" class="symbol symbol-50px"><span class="symbol-label" style="background-image:url(../assets/uploads/product/'.$row['product_img'].');"></span></a><div class="ms-5"><a href="#" class="text-gray-800 text-hover-primary fs-5 fw-bolder mb-1" product-filter="product_name">'.$row['name'].'</a></div>';
		  }),
		  
	array('db' => 'sku',	
	      'dt' => 2),	
	
	array('db' => 'credits',	
	      'dt' => 3),	
	
	array('db' => 'display_order',	
	      'dt' => 4,		  
		  'formatter' => function( $d, $row ) {
		  	return '<div class="d-flex justify-content-end"><input type="text" value='.$row['display_order'].' onkeyup=this.value=this.value.replace(/[^0-9]/g,"") class="form-control display_order_val" data-id="'.$row['product_id'].'" style="max-width: 55px;" maxlength="3" /></div>';
		  }),	  	  	  
			
	array('db' => 'status',	
	      'dt' => 5,
		  'formatter' => function( $d, $row ) {
			   if($row['status'] == 'Y') { 
			     return  '<div class="form-check form-switch form-check-custom form-check-solid float-end"><input class="form-check-input h-30px w-50px status" name="status" type="checkbox" data-id="'.$row['product_id'].'" value="'.$row['status'].'" id="flexSwitchChecked" checked="checked"/>
    <label class="form-check-label" for="flexSwitchChecked"></div>';}
			  else {
				  return  '<div class="form-check form-switch form-check-custom form-check-solid float-end"><input class="form-check-input h-30px w-50px status" name="status" type="checkbox" data-id="'.$row['product_id'].'" value="'.$row['status'].'" id="flexSwitchChecked" />
    <label class="form-check-label" for="flexSwitchChecked"></div>';
			  }
		  }),		  
		  
	array('db' => 'product_id',
		  'dt' => 6,
		  'formatter' => function($d, $row) {
		    return '<a href="#" class="btn btn-light btn-active-light-primary btn-sm" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">Actions<span class="svg-icon svg-icon-5 m-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"><path d="M11.4343 12.7344L7.25 8.55005C6.83579 8.13583 6.16421 8.13584 5.75 8.55005C5.33579 8.96426 5.33579 9.63583 5.75 10.05L11.2929 15.5929C11.6834 15.9835 12.3166 15.9835 12.7071 15.5929L18.25 10.05C18.6642 9.63584 18.6642 8.96426 18.25 8.55005C17.8358 8.13584 17.1642 8.13584 16.75 8.55005L12.5657 12.7344C12.2533 13.0468 11.7467 13.0468 11.4343 12.7344Z" fill="black" /></svg></span></a><div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-bold fs-7 w-125px py-4" data-kt-menu="true"><div class="menu-item px-3"><a href="index.php?file=product/product_add&axn=edit&product_id='.$row['product_id'].'" class="menu-link px-3" data-id="'.$row['product_id'].'">Edit</a></div><div class="menu-item px-3"><a href="#" class="menu-link px-3" product-filter="delete_row" data-id="'.$row['product_id'].'">Delete</a></div></div>';
		  }),		  
 );
 
$joins =  array('');
echo json_encode((SSP::simple( $_POST, $sql_details,$columns,$tables,$fields,$joins,$keys,$alias))); 
?>