<?php
$sql_details = array(
	'user' => 'root',
	'pass' => '',
	'db'   => 'morpheus',
	'host' => 'localhost'
);
class SSP {
	static function data_output ( $columns, $data )
	{
		$out = array();
		for ( $i=0, $ien=count($data) ; $i<$ien ; $i++ ) {
			$row = array();
			for ( $j=0, $jen=count($columns) ; $j<$jen ; $j++ ) {
				$column = $columns[$j];

				// Is there a formatter?
				if ( isset( $column['formatter'] ) ) {
					$row[ $column['dt'] ] = $column['formatter']( $data[$i][ $column['db'] ], $data[$i] );
				}
				else {
					$row[ $column['dt'] ] = utf8_encode($data[$i][ $columns[$j]['db'] ]);
				}
			}
			$out[] = $row;
		}
		return $out;
	}

	static function limit ( $request, $columns )
	{
		$limit = '';
		if ( isset($request['start']) && $request['length'] != -1 ) {
			$limit = "LIMIT ".intval($request['start']).", ".intval($request['length']);
		}
		return $limit;
	}

	static function order ( $request, $columns )
	{
		$order = '';
		if ( isset($request['order']) && count($request['order']) ) {
			$orderBy = array();
			$dtColumns = self::pluck( $columns, 'dt' );
     
			for ( $i=0, $ien=count($request['order']) ; $i<$ien ; $i++ ) {
				// Convert the column index into the column data property
				$columnIdx = intval($request['order'][$i]['column']);
				$requestColumn = $request['columns'][$columnIdx];
                 $columnIdx = array_search( $requestColumn['data'], $dtColumns );
				$column = $columns[ $columnIdx ];
			   
				if ( $requestColumn['orderable'] == 'true' ) {
					$dir = $request['order'][$i]['dir'] === 'asc' ?
						'ASC' :
						'DESC';

					$orderBy[] = '`'.$column['db'].'` '.$dir;
				}
			}
			$order = 'ORDER BY '.implode(', ', $orderBy);
		}
		return $order;
	}

	/**
	 * Searching / Filtering
	 *
	 * Construct the WHERE clause for server-side processing SQL query.
	 *
	 */
	static function filter ( $request, $columns, &$bindings )
	{
		$globalSearch = array();
		$columnSearch = array();
		$dtColumns = self::pluck( $columns, 'dt' );

		if ( isset($request['search']) && $request['search']['value'] != '' ) {
			$str = $request['search']['value'];	
			//echo "<pre>-->";print_r($str);
				for ( $i=0, $ien=count($request['columns']) ; $i<$ien ; $i++ ) {
				$requestColumn = $request['columns'][$i];
				//echo "<pre>requestColumn-->";print_r($requestColumn);
				$columnIdx = array_search( $requestColumn['data'], $dtColumns );
				//echo "<pre>-->";print_r($columnIdx);
				$column = $columns[ $columnIdx ];
				//echo "<pre>column-->";print_r($column);
				
				if($column['db']=='product_id' && $column['dt']==0){
					$table_name = 'product';
				}
				
				if($column['db']=='category_id' && $column['dt']==0){
					$table_name = 'category';
				}
				
				if($column['db']=='orders_id' && $column['dt']==0){
					$table_name = 'orders';
				}
				
				if(!isset($table_name)){
					$table_name = 'any';
				}
				
				if ($table_name == 'category' && $requestColumn['searchable'] == 'true' ) {
						$binding = self::bind( $bindings, '%'.$str.'%', PDO::PARAM_STR );
						$globalSearch[] = "c.".$column['db']." LIKE ".$binding;
				}
				elseif ($table_name == 'product' && $requestColumn['searchable'] == 'true' ) {
					    if($column['db']=='status')
						{
							$column['db']='product_id';
						}
						$binding = self::bind( $bindings, '%'.$str.'%', PDO::PARAM_STR );
						$globalSearch[] = "`".$column['db']."` LIKE ".$binding;
				}
				elseif ($table_name == 'orders' && $requestColumn['searchable'] == 'true' ) {
					    $binding = self::bind( $bindings, '%'.$str.'%', PDO::PARAM_STR );
						if($column['db']=='fname' || $column['db']=='lname' || $column['db']=='email')
						{
							$concat = "c.";
						}
						else
						{
							$concat = "o.";
						}
						$globalSearch[] =$concat.$column['db']." LIKE ".$binding;
				}
                else
				{
					if ( $requestColumn['searchable'] == 'true' ) {
						$binding = self::bind( $bindings, '%'.$str.'%', PDO::PARAM_STR );
						$globalSearch[] = "`".$column['db']."` LIKE ".$binding;
						//echo "<pre>->globalSearch";print_r($globalSearch);
					}
				}
			}
		}
       
		$where = '';
		if ( count( $globalSearch ) ) {
			$where = '('.implode(' OR ', $globalSearch).')';
		}
		if ( count( $columnSearch ) ) {
			$where = $where === '' ?
				implode(' AND ', $columnSearch) :
				$where .' AND '. implode(' AND ', $columnSearch);
		}
		if ( $where !== '' ) {
			$where = 'WHERE '.$where;
		}
		return $where;
	}
	
	static function simple ($request, $sql_details,$columns,$tables,$fields,$joins,$keys,$alias)
    {
		$val_table		= self::tables($tables);
		$bindings = array();
		$db = self::sql_connect( $sql_details );
   
		// Build the SQL query string from the request
		$limit = self::limit( $request, $columns );
		$order = self::order( $request, $columns);
		$where = self::filter( $request, $columns, $bindings );	

        $val_table		= self::tables($tables);
		$val_field		= self::fields($fields);
		$val_join		= self::joins($joins);
		$val_key		= self::joins($keys);
		$val_alias		= self::joins($alias);
		
		
	 	$data = self::sql_exec( $db, $bindings,
				"SELECT  SQL_CALC_FOUND_ROWS $val_field
				 FROM $val_table  as $val_alias $val_join
					 $where
					 $order
					 $limit");
		
      // Data set length after filtering

		$resFilterLength = self::sql_exec( $db,
			"SELECT FOUND_ROWS()"
		);
		$recordsFiltered = $resFilterLength[0][0];

		$resTotalLength = self::sql_exec( $db,
			"SELECT COUNT(`{$val_key}`)
			 FROM   `$val_table`"
		);
		$recordsTotal = $resTotalLength[0][0];
		return array(
			"draw"            => intval( $request['draw'] ),
			"recordsTotal"    => intval( $recordsTotal ),
			"recordsFiltered" => intval( $recordsFiltered ),
			"data"            => self::data_output( $columns, $data),
			
		);
	}

	static function sql_connect ( $sql_details )
	{
		try {
			$db = @new PDO(
				"mysql:host={$sql_details['host']};dbname={$sql_details['db']}",
				$sql_details['user'],
				$sql_details['pass'],
				array( PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION )
			);
		}
		catch (PDOException $e) {
			self::fatal(
				"An error occurred while connecting to the database. ".
				"The error reported by the server was: ".$e->getMessage()
			);
		}
		return $db;
	}

	static function sql_exec ( $db, $bindings, $sql=null )
	{
		// Argument shifting
		if ( $sql === null ) {
			$sql = $bindings;
		}
	   //print_r($sql);
		$stmt = $db->prepare( $sql );
       //echo "<pre>";print_r($stmt);
		// Bind parameters
		if ( is_array( $bindings ) ) {
			for ( $i=0, $ien=count($bindings) ; $i<$ien ; $i++ ) {
				$binding = $bindings[$i];
				$stmt->bindValue( $binding['key'], $binding['val'], $binding['type'] );
			}
		}
        //echo "<pre>stmt";print_r($stmt);exit;
		// Execute
		try {
			$stmt->execute();
		}
		catch (PDOException $e) {
			self::fatal( "An SQL error occurred: ".$e->getMessage() );
		}
		// Return all
		return $stmt->fetchAll();
	}

	static function fatal ( $msg )
	{
		echo json_encode( array( 
			"error" => $msg
		) );
		exit(0);
	}

	static function bind ( &$a, $val, $type )
	{
		$key = ':binding_'.count( $a );
		$a[] = array(
			'key' => $key,
			'val' => $val,
			'type' => $type
		);
		return $key;
	}

	static function pluck ( $a, $prop )
	{
		$out = array();
		for ( $i=0, $len=count($a) ; $i<$len ; $i++ ) {
			$out[] = $a[$i][$prop];
		}
		return $out;
	}
	
	static function tables ($tables)
	{
		$out = implode(',',$tables);
	 // echo "<pre>";print_r($out);
	   return $out;
	}
	
	static function fields ($fields)
	{
		$fout = implode(',',$fields);
        //print_r($fout);exit;
		return $fout;
	}
	static function joins ($joins)
	{
		$jout = implode(',',$joins);
	 // echo "<pre>";print_r($jout);
		return $jout;
	}
	static function keys ($keys)
	{
		$kout = implode(',',$keys);
	 // echo "<pre>";print_r($out);
	   return $kout;
	}
	
	static function alias ($alias)
	{
		$aout = implode(',',$alias);
	 // echo "<pre>";print_r($out);
	   return $aout;
	}
}
?>