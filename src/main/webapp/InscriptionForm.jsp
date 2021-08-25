<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gestion des inscriptions accadémiques</title>
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
					</div>
				</div>

				<!-- Modal Header -->
				<div class="modal-header">
					<c:if test="${!details}">
						<c:if test="${inscription != null}">
							<h4 class="modal-title">Modifier inscription</h4>

						</c:if>

						<c:if test="${inscription == null}">
							<h4 class="modal-title">Nouveau inscription</h4>

						</c:if>
					</c:if>
					<c:if test="${details}">
						<h4 class="modal-title">Détails inscription</h4>

					</c:if>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<c:if test="${inscription != null}">
						<form action="inscriptions?action=update" method="post">
					</c:if>

					<c:if test="${inscription == null}">
						<form action="inscriptions?action=save" method="post">
					</c:if>
					<c:if test="${inscription != null}">
						<input type="hidden" value="${inscription.id }" name="id">
					</c:if>

					<div class="form-group">
						<label>Nom</label>
						<input ${ details ? 'disabled="disabled"' : ''} type="text"
							class="form-control" value="${inscription.nom }" required
							name="nom">
					</div>
					<div class="form-group">
						<label>Date naissance</label>
						<input ${ details ? 'disabled="disabled"' : ''} type="date"
							class="form-control"
							value="<fmt:formatDate value="${inscription.dateNaissance }" pattern="yyyy-MM-dd" />"
							required name="dateNaissance">
					</div>

					<div class="form-group">
						<label>Etablissement</label>
						<select name="etablissement" ${ details ? 'disabled="disabled"' : ''} class="form-control">
							<c:forEach items="${listEtablissements}" var="etablis">
								<option value="${etablis.id}">${etablis.nom}</option>
							</c:forEach>
						</select>
					</div>
					
					<div class="form-group">
						<label>Examen</label>
						<select name="examen" ${ details ? 'disabled="disabled"' : ''} class="form-control">
							<c:forEach items="${listExamens}" var="exam">
								<option <c:if test='${param.selectValue == exam.id}'> selected </c:if> value="${exam.id}">${exam.libelle}</option>
							</c:forEach>
						</select>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<a href="inscriptions" class="btn btn-danger">Annuler</a>
						<c:if test="${!details}">
							<c:if test="${inscription != null}">
								<input type="submit" class="btn btn-success" value="Modifier"
									name="action">
							</c:if>

							<c:if test="${inscription == null}">
								<input type="submit" class="btn btn-success" value="Ajouter"
									name="action">
							</c:if>
						</c:if>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>