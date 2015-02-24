<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Isloged extends CI_Controller {

    public function isloged($login, $mail, $nom, $prenom)
    {
        
        $newdata = array(
            'login'  => $login,
            'email'     => $mail,
            'nom'     => $nom,
            'prenom'     => $prenom,
            'logged_in' => TRUE
        );

        $this->session->set_userdata($newdata);
        
    }   
}