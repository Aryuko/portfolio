<?php
require "alloy/view.php";
include_once "db_connect.php";
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
	
		$template = View::Get("views/projecttemplate.html");

		$stmt = $dbh->prepare("SELECT (project_name) FROM `project`");
		$stmt->execute();
		$res = $stmt->get_result();
		$row = $res->fetch_assoc();
		$template->SetData("project_name","Hej"/*$row['project_name']*/);
		#echo $row['project_name'];
	
		$view->SetAppend("projects",true);		
		$view->AddData("projects",$template);
	
		#$view->
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