<!DOCTYPE html>
<html>
	<head>
		<title><?php echo $title; ?></title>
		<?php include_once('./application/views/include/include.php'); ?>
	</head>
	<body>
		<div class="row">
			<div class="col-lg-12 entete">
				<div class="col-lg-2 col-md-3 col-sm-4 col-xs-7">
					<p class="entete-150"><img src="/assets/images/entete/logo_ipssi.png" alt="logo" class="entete-img-ipssi"/></p>
				</div>
				<div class="col-lg-2 visible-lg">
					<p class="entete-150"><img src="/assets/images/entete/logo.png" alt="logo" class="entete-img-ip"/></p>
				</div>
				<div class="col-lg-4 col-lg-offset-0 col-md-5 visible-lg visible-md">
					<p class="italique center entete-titre">L'institut privée Supérieur des Systèmes d'Information</p>
				</div>
				<div class="col-lg-1 col-lg-offset-1 col-md-1 col-md-offset-0 col-sm-1 col-sm-offset-3 col-xs-2 col-xs-offset-3 reseaux">
					<a class="btn btn-social-icon btn-facebook reseau"><i class="fa fa-facebook"></i></a><br/>
					<a class="btn btn-social-icon btn-linkedin reseau"><i class="fa fa-linkedin"></i></a><br/>					
					<a class="btn btn-social-icon btn-twitter reseau"><i class="fa fa-twitter"></i></a><br/>
				</div>
				<div class="col-lg-2 col-md-3 col-sm-4 entete-droite visible-lg visible-md visible-sm">
					<div class="col-lg-12 col-md-12">
						<div class="input-group">
	      						<input type="text" class="form-control" placeholder="Rechercher">
	      						<span class="input-group-btn">
								<button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
	      						</span>
						</div>
					</div>
					<div class="col-lg-12 col-md-12">
						<br/><a href="#" class="btn btn-primary btn-block">Mon IPSSI</a>
					</div>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span>Menu</span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<div class="input-group visible-xs">
							<div class="row">							
								<div class="col-xs-9 col-xs-offset-1">
										<input type="text" class="form-control" placeholder="Rechercher"/>
								</div>
								<span class="input-group-btn">
									<button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
									</span>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<br/><a href="#" class="btn btn-primary btn-block">Mon IPSSI</a>
								</div>
							</div><hr/>				
						</div>
						<li><a href="#">Accueil</a></li>
						
						<?php
							foreach($menu as $m)
							{
								if($m->nb_sous_menu() > 0)
								{
									echo '<li class="dropdown">';
									echo '<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">'.$m->libelle_menu().'<span class="caret"></span></a>';
									echo '<ul class="dropdown-menu" role="menu">';
									foreach($m->sous_menus() as $sm)
									{
										echo '<li><a href="#">'.$sm->libelle_sous_menu.'</a></li>';
									}
									echo '</ul>';
									echo '</li>';
								}
								else
									echo '<li><a href="#">'.$m->libelle_menu().'</a></li>';
							}
						?>
					</ul>
				</div>
			</div>
		</nav>
		<!--<nav class="navbar navbar-default">
  			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span>Menu</span>
					</button>
				</div>

				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="#">Accueil</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Le groupe <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Présentation</a></li>
								<li><a href="#">Chiffres clés</a></li>
								<li><a href="#">Notre expertise</a></li>
								<li><a href="#">Les valeurs du groupe</a></li>
							</ul>
						</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">L'activité <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Nos métiers</a></li>
							<li><a href="#">Nos secteurs d'activités</a></li>
							<li><a href="#">Ils nous font confiance</a></li>
						</ul>
					</li>
					<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Nous rejoindre <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Les postes à pourvoir</a></li>
								<li><a href="#">Postuler</a></li>
							</ul>
						</li>
					<li><a href="#">Espace collaborateur</a></li>
					<li><a href="#">Contact</a></li>
					</ul>
				</div>
  			</div>
		</nav>-->