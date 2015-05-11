<?php

    define('DB_USER',		'root');
    define('DB_PASSWORD',	'');
    define('DB_NAME', 		'portfolio');
    define('DB_HOST', 		'localhost');

    $dbh = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
	$dbh->set_charset("utf8");

?>