<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
</head>
<body>
	<nav
		class="navbar navbar-icon-top navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="examens">
						<i class="fa fa-home"></i>
						Home
						<span class="sr-only">(current)</span>
					</a>
				</li>

				<li class="nav-item dropdown active">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">
						<i class="fa fa-graduation-cap" aria-hidden="true"></i>
						Elèves
						<span class="sr-only">(current)</span>
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="inscriptions">Inscription</a>
						<a class="dropdown-item"
							href="examens">Examens</a>
						<a class="dropdown-item" href="etablissements">Etablissements</a>
					</div>
				</li>

				<li class="nav-item dropdown active">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">
						<i class="fa fa-home"></i>
						Autres
						<span class="sr-only">(current)</span>
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="epreuves">Epreuves</a>
						<a class="dropdown-item" href="enseignants">Enseignants</a>
						<a class="dropdown-item" href="notes">Notes</a>
					</div>
				</li>
			</ul>
			<ul class="navbar-nav ">
				<li class="nav-item">
					<a class="nav-link" href="#">
						<i class="fa fa-bell">
							<span class="badge badge-danger">11</span>
						</i>
					</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Profil </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Mon profil</a>
						<a class="dropdown-item" href="#">Déconnexion</a>
					
					</div>
				</li>
			</ul>
		</div>
	</nav>

</body>
</html>