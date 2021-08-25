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
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"
	type="text/javascript"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document)
			.on(
					"click",
					".deleteEmployeeModal",
					function() {
						var myBookId = $(this).data('id');
						console.log(myBookId);

						var newContent = '<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel"><a class="btn btn-danger" href="examens?action=delete&id='
								+ myBookId + '">Supprimer</a>'
						$(".modal-footer").html(newContent);
						$('#deleteExamenModal').modal('toggle')
					});
</script>

<link rel="stylesheet" href="css/styles.css">
</head>
<body style="font-size: 1vw;">
	<!-- on insert le navbar -->
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="container">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-xs-6">
							<h2>
								Gestion
								<b>Examens</b>
							</h2>
						</div>
						<div class="col-xs-6">
							<a href="examens?action=new" class="btn btn-success">
								<i class="material-icons">&#xE147;</i>
								<span>Ajouter un nouvel examen</span>
							</a>
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
					</tbody>
					<tbody>
						<c:forEach items="${examens}" var="ex">
							<tr>
								<td>${ex.id }</td>
								<td>${ex.code }</td>
								<td>${ex.libelle }</td>
								<td>
									<fmt:formatDate pattern="dd/MM/yyyy" value="${ex.date }" />
								</td>
								<td>
									<a href="examens?action=details&amp;id=${ex.id }" class="view">
										<i class="glyphicon glyphicon-eye-open text-primary"></i>
									</a>
									<a href="examens?action=edit&amp;id=${ex.id }" class="edit">
										<i class="glyphicon glyphicon-edit text-warning"></i>
									</a>
									<a href="#" class="delete deleteEmployeeModal"
										data-toggle="modal" data-id="${ex.id }"
										data-target="#deleteEmployeeModal">
										<i class="glyphicon glyphicon-trash text-danger"></i>
									</a>
								</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- Delete Modal HTML -->
	<div class="modal" id="deleteExamenModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="">
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