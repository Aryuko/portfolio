<?php
require "alloy/view.php";
use Alloy\View;

$master = View::Get("views/master.html");

$subview = $path[1];
switch($subview)
{
	default:
	case "home":
		$view = View::Get("views/home.html");
		$master->SetData("title", "Home");
		$master->SetData("content", $view);
	
		$master->SetAttribute("homebutton", "class", "current");
		$master->SetAttribute("projectsbutton", "class", "");
		$master->SetAttribute("contactbutton", "class", "");
		break;
	case "projects":
		$view = View::Get("views/projects.html");
		$master->SetData("title", "Projects");
		$master->SetData("content", $view);
	
		$master->SetAttribute("homebutton", "class", "");
		$master->SetAttribute("projectsbutton", "class", "current");
		$master->SetAttribute("contactbutton", "class", "");
		break;
	case "contact":
		$view = View::Get("views/contact.html");
		$master->SetData("title", "Contact");
		$master->SetData("content", $view);
	
		$master->SetAttribute("homebutton", "class", "");
		$master->SetAttribute("projectsbutton", "class", "");
		$master->SetAttribute("contactbutton", "class", "current");
		break;
}

$master->render();
?>	