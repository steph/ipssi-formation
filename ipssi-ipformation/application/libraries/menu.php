<?php

class Menu
{	
	//Attributs
	private $id_menu;
	private $libelle_menu;
	private $nb_sous_menu;
	private $sous_menus; //Tableau
	
	//Accesseurs
	public function id_menu() { return $this->id_menu; }
	public function libelle_menu() { return $this->libelle_menu; }
	public function nb_sous_menu() { return $this->nb_sous_menu; }
	public function sous_menus() { return $this->sous_menus; }
	
	//Constructeurs
	public function __construct($id_menu = '', $libelle_menu = '', $nb_sous_menu = '')
    {
		$this->id_menu = $id_menu;
		$this->libelle_menu = $libelle_menu;
		$this->nb_sous_menu = $nb_sous_menu;
		$this->sous_menus = '';
    }
	
	//Fonction permettant de récupérer les menus en base de données accompagnés de leurs sous-menus.
	//IN : /
	//OUT : tableau d'objet Menu
	public function recupMenu()
	{
		$CI =& get_instance();
		$menus = array();
		
		$CI->db->select('menu.id_menu, libelle_menu, count(id_sous_menu) as nb_sous_menu', false);
		$CI->db->from('menu');
		$CI->db->join('sous_menu SM', 'menu.id_menu = SM.id_menu', 'left');
		$CI->db->where('id_presence', 2);
		$CI->db->group_by('libelle_menu');
		$CI->db->order_by('menu.tri');
		$result = $CI->db->get()->result();
		
		foreach($result as $r)
		{
			$menu = new Menu($r->id_menu, $r->libelle_menu, $r->nb_sous_menu);

			if($r->nb_sous_menu > 0)
			{
				$sous_menus = $this->recupSousMenu($r->id_menu);
				$menu->sous_menus = $sous_menus;
			}
			
			array_push($menus, $menu);
		}

		return $menus;
	}
	
	//Fonction permettant de récupérer les sous-menus liés à un menu
	//IN : idMenu
	//OUT : tableau du résultat de la requête
	public function recupSousMenu($idMenu)
	{
		$CI =& get_instance();
		$CI->db->select('id_sous_menu, libelle_sous_menu');
		$CI->db->from('sous_menu');
		$CI->db->where('id_menu', $idMenu);
		$CI->db->order_by('tri');
		$result = $CI->db->get()->result();
		
		return $result;
	}
}