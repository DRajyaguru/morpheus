<?php
include_once( '../../lib/ssp.class.php');
$tables  = array('orders');
$fields  = array('o.orders_id','o.status','o.total_credits','o.order_date','c.first_name','c.last_name');
$keys    = array('orders_id');
$alias   = array('o');

//Number of columns to show in order List
$columns = array(
    array('db' => 'orders_id',	
	      'dt' => 0,
		  'formatter' => function( $d, $row ) {
		  	return '<a href="#" class="text-gray-800 text-hover-primary fw-bolder">'.$row['orders_id'].'</a>';
		  }),
		  
    array('db' => 'first_name',	
	      'dt' => 1,
		  'formatter' => function( $d, $row ) {
		  	return '<a href="#" class="text-gray-800 text-hover-primary fs-5 fw-bolder">'.$row['first_name'].' '.$row['last_name'].'</a>';
		  }),
	
	array('db' => 'total_credits',	
	      'dt' => 2,
		  'formatter' => function( $d, $row ) {
			  return '<span class="fw-bolder">'.$row['total_credits'].'</div>';
		  }),	  
		   
	array('db' => 'status',
	      'dt' => 3,
		  'formatter' => function( $d, $row ) {
			  $status = '';
			  switch($row['status']){
				case "Completed":
					$status= 'badge-light-success';
					break;
				case "Denied":
					$status= 'badge-light-danger';
					break;
				case "Delivering":
					$status= 'badge-light-primary';
					break;
				case "Cancelled":
					$status= 'badge-light-danger';
					break;
				case "Pending":
					$status= 'badge-light-warning';
					break;
			  }
			  return '<div class="badge '.$status.'">'.$row['status'].'</div>';
		  }),	
		  
	array('db' => 'order_date',	
	      'dt' => 4,
		  'formatter' => function( $d, $row ) {
			  return '<span class="fw-bolder">'.$row['order_date'].'</div>';
		  }),
 );
 
$joins =  array('INNER JOIN customer c ON (o.customer_id = c.customer_id)');
echo json_encode((SSP::simple( $_POST, $sql_details,$columns,$tables,$fields,$joins,$keys,$alias))); 
?>