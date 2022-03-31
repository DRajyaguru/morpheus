<?php
include_once( '../../lib/ssp.class.php');
$tables  = array('admin');
$fields  = array('a.admin_id','a.first_name','a.last_name','a.email','a.status');
$keys    = array('admin_id');
$alias   = array('a');

$columns = array(
	array('db' => 'admin_id',		
	      'dt' => 0,
		  'formatter' => function($d,$row) {
			return '<div class="form-check form-check-sm form-check-custom form-check-solid"><input class="form-check-input all-checked" type="checkbox" value="'.$row['admin_id'].'" /></div>';
		  }),
 
    array('db' => 'first_name',	
	      'dt' => 1),
			
    array('db' => 'last_name',	
	      'dt' => 2),
			
	array('db' => 'email',	
	      'dt' => 3),
		  
	array('db' => 'status',	
	      'dt' => 4,
		  'formatter' => function( $d, $row ) {
			   if($row['status'] == 'Y') { 
			     return  '<div class="form-check form-switch form-check-custom form-check-solid"><input class="form-check-input h-30px w-50px status" name="status" type="checkbox" data-id="'.$row['admin_id'].'" value="'.$row['status'].'" id="flexSwitchChecked" checked="checked"/>
    <label class="form-check-label" for="flexSwitchChecked"></div>';}
			  else {
				  return  '<div class="form-check form-switch form-check-custom form-check-solid"><input class="form-check-input h-30px w-50px status" name="status" type="checkbox" data-id="'.$row['admin_id'].'" value="'.$row['status'].'" id="flexSwitchChecked" />
    <label class="form-check-label" for="flexSwitchChecked"></div>';
			  }
		  }),		  
		  
	array('db' => 'admin_id',
		  'dt' => 5,
		  'formatter' => function($d, $row) {
		    return '<a href="#" class="btn btn-light btn-active-light-primary btn-sm" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">Actions<span class="svg-icon svg-icon-5 m-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"><path d="M11.4343 12.7344L7.25 8.55005C6.83579 8.13583 6.16421 8.13584 5.75 8.55005C5.33579 8.96426 5.33579 9.63583 5.75 10.05L11.2929 15.5929C11.6834 15.9835 12.3166 15.9835 12.7071 15.5929L18.25 10.05C18.6642 9.63584 18.6642 8.96426 18.25 8.55005C17.8358 8.13584 17.1642 8.13584 16.75 8.55005L12.5657 12.7344C12.2533 13.0468 11.7467 13.0468 11.4343 12.7344Z" fill="black" /></svg></span></a><div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-bold fs-7 w-125px py-4" data-kt-menu="true"><div class="menu-item px-3"><a href="#" class="menu-link px-3 edit_admin" data-id="'.$row['admin_id'].'" data-bs-toggle="modal" data-bs-target="#kt_modal_add_admin">Edit</a></div><div class="menu-item px-3"><a href="#" class="menu-link px-3" data-kt-admins-table-filter="delete_row" data-id="'.$row['admin_id'].'">Delete</a></div></div>';
		  }),		  
 );
 
$joins =  array('');
echo json_encode((SSP::simple( $_POST, $sql_details,$columns,$tables,$fields,$joins,$keys,$alias))); 
?>