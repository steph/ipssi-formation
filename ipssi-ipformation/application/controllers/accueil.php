<?php

class Accueil extends CI_Controller
{	
	public function __construct()
	{
		parent::__construct();
		
		$this->load->library('menu');
	}
	
	public function index()
	{
		$menu['title'] = "ipssi.fr";
		$menu['menu'] = $this->menu->recupMenu();
		
		$this->load->view('include/menu.php', $menu);
		$this->load->view('accueil.php');
	}
}

?>
