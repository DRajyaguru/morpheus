<?php
include_once( '../../lib/ssp.class.php');
$tables  = array('orders');
$fields  = array('o.order_id','o.status','o.total','o.order_date','c.first_name');
$keys    = array('order_id');
$alias   = array('o');

//Number of columns to show in order List
$columns = array(
	
    array('db' => 'order_id',	
	      'dt' => 0,
		  'formatter' => function( $d, $row ) {
		  	return '<div class="d-flex"><div class="ms-5"><a href="#" class="text-gray-600 text-hover-primary fs-5 fw-bolder mb-1" order-filter="order_id">'.$row['order_id'].'</a></div>';
		  }),
    array('db' => 'first_name',	
	      'dt' => 1),    
	array('db' => 'status',
	      'dt' => 2,
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
	array('db' => 'total',	
	      'dt' => 3),
	array('db' => 'order_date',	
	      'dt' => 4),
 );
 
$joins =  array('INNER JOIN customer c ON (o.customer_id = c.customer_id)');
echo json_encode((SSP::simple( $_POST, $sql_details,$columns,$tables,$fields,$joins,$keys,$alias))); 
?>