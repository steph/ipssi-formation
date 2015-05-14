<?php

class Connexion extends CI_Controller
{	
	public function __construct()
	{
		parent::__construct();
		
		$this->load->library('menu');
		$this->load->library('form_validation');
		$this->load->model('connexion_model');
	}
	
	public function index()
	{
		$menu['title'] = "Connexion à l'intranet";
		$menu['menu'] = $this->menu->recupMenu();
		
		$this->load->view('include/menu.php', $menu);
		
		$this->load->view('connexion.php');
	}

	public function tentative()
	{
		if(isset($_POST['connexion']))
		{
			$this->form_validation->set_rules('identifiant', '"Identifiant"', 'trim|encode_php_tags|xss_clean');
			$this->form_validation->set_rules('mdp', '"Mot de passe"', 'trim|encode_php_tags|xss_clean');

			$identifiant = $this->input->post('identifiant');
			$mdp = $this->input->post('mdp');

			if($this->form_validation->run())
			{
				$erreur = $this->connexion_model->verifierSaisieIndentifiant($identifiant, $mdp);

				if($erreur == '')
				{
					$mdp = hash('sha256', $mdp);

					$erreur = $this->connexion_model->verifierIndentifiant($identifiant, $mdp);

					if($erreur != '')
					{
						$data['erreurConnexion'] = $erreur;
						$menu['title'] = "Connexion à l'intranet";
						$menu['menu'] = $this->menu->recupMenu();
						$this->load->view('include/menu.php', $menu);
						
						$this->load->view('connexion.php', $data);
					}
					else
					{
						$result = $this->connexion_model->recupInfosSession($identifiant);
					}
				}
				else
				{
					$data['erreurConnexion'] = $erreur;
					$menu['title'] = "Connexion à l'intranet";
					$menu['menu'] = $this->menu->recupMenu();
					$this->load->view('include/menu.php', $menu);
					
					$this->load->view('connexion.php', $data);
				}
			}
			else
			{
				$menu['title'] = "Connexion à l'intranet";
				$menu['menu'] = $this->menu->recupMenu();
				$this->load->view('include/menu.php', $menu);
				$this->load->view('connexion.php');
			}	
		}
		else
			Redirect('/connexion');
	}
}

?>
