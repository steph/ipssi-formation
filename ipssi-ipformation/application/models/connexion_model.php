<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Connexion_model extends CI_Model
{
	protected $tableUtilisateur = 'utilisateur';
	
	public function verifierIndentifiant($identifiant, $mdp)
	{
		$erreur = '';
		
		$this->db->select('mail, mdp');
		$this->db->from($this->tableUtilisateur);
		$this->db->where('mdp', $mdp);
		$this->db->where('mail = "'.$identifiant.'"');
		$query = $this->db->get();
		
		$nb = $query->num_rows();
		
		if($nb == 0)
			$erreur = "Identifiant ou mot de passe incorrect.";
		else if($nb != 1)
			$erreur = "Problème avec votre compte : duplicata de l'identifiant en base de données.";
		
		return $erreur;
	}

	public function verifierSaisieIndentifiant($identifiant, $mdp)
	{
		$erreur = '';
		$regex = "/^([a-zA-Z0-9_\.-]+\@[a-zA-Z0-9\.-]+\.[a-zA-Z\.]{2,6})$/";

		if(empty($identifiant))
			$erreur = "Veuillez saisir votre identifiant";
		else if(!preg_match($regex, $identifiant))
			$erreur = "Veuillez saisir une adresse email valide comme identifiant";
		else if(empty($mdp))
			$erreur = "Veuillez saisir un mot de passe";

		return $erreur;
	}
}