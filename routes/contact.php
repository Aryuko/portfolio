<?php
	require "alloy/view.php";
	use Alloy\View;

	$master = View::Get("views/master.html");

	$master->SetData("title", "Contact");

	$contact = View::Get("views/contact.html");
	$master->SetData("body", $contact);


	$master->render();
?>
