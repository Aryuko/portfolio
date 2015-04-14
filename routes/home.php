<?php
	require "alloy/view.php";
	use Alloy\View;

	$master = View::Get("views/master.html");

	$master->SetData("title", "Home");

	$home = View::Get("views/home.html");
	$master->SetData("body", $home);

	$master->render();
?>
