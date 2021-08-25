<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gestion des examens accadémiques</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document)
			.on(
					"click",
					".deleteEmployeeModal",
					function() {
						var myBookId = $(this).data('id');
						console.log(myBookId);

						var newContent = '<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel"><a class="btn btn-danger" href="controleur.do?action=supprimer&id='
								+ myBookId + '">Supprimer</a>'
						$(".modal-footer").html(newContent);
						$('#deleteExamenModal').modal('toggle')
					});
</script>

<link rel="stylesheet" href="css/styles.css">
</head>
<body style="font-size: 1vw;">
	<!-- on insert le navbar -->
	<div class="container">

		<!-- Button to Open the Modal -->
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#myModal">Open modal</button>


		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-xs-6">
							<h2>
								Gestion <b>Examens</b>
							</h2>
						</div>
						<div class="col-xs-6">
							<a data-target="#addExamenModal" class="btn btn-success"
								data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Ajouter
									un nouvel examen</span></a> <a class="btn btn-danger" data-toggle="modal"><i
								class="material-icons">&#xE15C;</i> <span>Delete</span></a>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>Code</th>
							<th>Libelle</th>
							<th>Date</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
					<tbody>
						<c:forEach items="${examens}" var="ex">
							<tr>
								<td>${ex.id }</td>
								<td>${ex.code }</td>
								<td>${ex.libelle }</td>
								<td><fmt:formatDate pattern="dd/MM/yyyy"
										value="${ex.date }" /></td>
								<td>
									<a data-target="#detailsExamenModal" class="view" data-toggle="modal" href="controleur.do?action=details&id=${ex.id }"><i class="material-icons">&#xE417;</i></a>
									<a data-target="#editExamenModal" class="edit" data-toggle="modal"><i class="material-icons" title="Edit">&#xE254;</i></a>
									<a class="delete deleteEmployeeModal" data-toggle="modal"
									data-id="${ex.id }" data-target="#deleteEmployeeModal"><i class="material-icons"
										title="Delete">&#xE872;</i></a>
										</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
		<!-- Add Modal HTML -->
	
		<div class="modal" id="addExamenModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
				<h4 class="modal-title">Nouveau examen</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
				
				<form action="controleur.do" method="post">
						<div class="form-group">
							<label>Code</label> <input type="text" class="form-control"
								required name="code">
						</div>
						<div class="form-group">
							<label>Libelle</label> <input type="text" class="form-control"
								required name="libelle">
						</div>
						<div class="form-group">
							<label>Date</label> <input type="date" class="form-control"
								required name="date">
						</div>
					
				<!-- Modal footer -->
				<div class="modal-footer">
						<input type="button" class="btn btn-danger" data-dismiss="modal"
							value="Annuler"> <input type="submit"
							class="btn btn-success" value="Ajouter examen" name="action">
					</div>
				</form>
				</div>


			</div>
		</div>
	</div>

		<!-- Details Modal HTML -->
	

		<div class="modal" id="detailsExamenModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
				<h4 class="modal-title">Détails examen</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
				
				<form action="controleur.do" method="post">
						<div class="form-group">
							<label>Code</label> <input type="text" class="form-control"
								required name="code">
						</div>
						<div class="form-group">
							<label>Libelle</label> <input type="text" class="form-control"
								required name="libelle">
						</div>
						<div class="form-group">
							<label>Date</label> <input type="date" class="form-control"
								required name="date">
						</div>
					
				<!-- Modal footer -->
				<div class="modal-footer">
						<input type="button" class="btn btn-danger" data-dismiss="modal"
							value="Fermer">
					</div>
				</form>
				</div>


			</div>
		</div>
	</div>

	<!-- Edit Modal HTML -->
					<div class="modal" id="editExamenModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
				<h4 class="modal-title">Modifier examen</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
				
				<form action="controleur.do" method="post">
						<div class="form-group">
							<label>Code</label> <input type="text" class="form-control"
								required name="code">
						</div>
						<div class="form-group">
							<label>Libelle</label> <input type="text" class="form-control"
								required name="libelle">
						</div>
						<div class="form-group">
							<label>Date</label> <input type="date" class="form-control"
								required name="date">
						</div>
					
				<!-- Modal footer -->
				<div class="modal-footer">
						<input type="button" class="btn btn-danger" data-dismiss="modal"
							value="Annuler"> <input type="submit"
							class="btn btn-success" value="Modifier examen" name="action">
					</div>
				</form>
				</div>


			</div>
		</div>
	</div>

	<!-- Delete Modal HTML -->
						<div class="modal" id="deleteExamenModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">
						<h4 class="modal-title">Delete Employee</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>Êtes-vous sûr de vouloir supprimer cet examen ?</p>
						<p class="text-warning">
							<small>Cette action ne peut être annulée.</small>
						</p>
					</div>
					<div class="modal-footer"></div>
				</form>


			</div>
		</div>
	</div>
</body>
</html>