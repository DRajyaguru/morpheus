<!DOCTYPE html>
<html lang="en">
<head>
    <title>{$title}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content=""> 
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Favicons -->
    <link rel="shortcut icon" href="assets/img/favicon.ico" />
    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <!-- Template Main CSS File -->
    <link href="assets/css/iclerisy_custom.css" rel="stylesheet">
    {if $smarty.get.font eq 'Montserrat'}
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <style type="text/css">
	  body, h1, h2, h3, h4, h5, h6 {
	    font-family: 'Montserrat', sans-serif;	  
	  }
	</style>
    {/if}
</head>
<body>
 	{include file=$top}
 	{include file=$middle}
 	{include file=$bottom}
    <!-- Common JS Files -->
    <script type="text/javascript" src="assets/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src= "assets/js/jquery-ui.min.js"></script>
  	<!-- Vendor JS Files -->
  	<script type="text/javascript" src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  	<!-- Template Main JS File -->
  	<script type="text/javascript" src="assets/js/main.js"></script>
    <script type="text/javascript" src="assets/js/validation/jquery.validate.js"></script>
    <script type="text/javascript" src="assets/js/iClerisy_custom.js"></script>
</body>
</html>