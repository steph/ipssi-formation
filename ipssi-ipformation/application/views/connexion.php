		<div class='container well'>
			<h1 class="titreH1">Connexion à l'intranet</h1>

			<?php 
				if(isset($erreurConnexion))
					echo '<div class="alert alert-danger" role="alert">'.$erreurConnexion.'</div>';
			?>

			<br/><form class="form-horizontal" method="post" action="/connexion/tentative">

					<div class="form-group">
						<label class="col-md-4 control-label" for="identifiant">Identifiant</label>  
						<div class="col-md-4">
							<input id="identifiant" name="identifiant" placeholder="Identifiant" class="form-control input-md" required="" type="text">
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-4 control-label" for="mdp">Mot de passe</label>
						<div class="col-md-4">
							<input id="mdp" name="mdp" placeholder="Mot de passe" class="form-control input-md" required="" type="password">
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-4 control-label" for="connexion"></label>
						<div class="col-md-4">
							<button id="connexion" name="connexion" class="btn btn-primary">Connexion</button>
						</div>
					</div>
			</form>
		</div>
	</body>
</html>
