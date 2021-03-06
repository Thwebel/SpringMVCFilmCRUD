<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film</title>
</head>
<body>


	<c:choose>

		<c:when test="${empty film}">
			<h3>No films were found</h3>
		</c:when>

		<c:otherwise>
			<table>
				<thead>
					<tr>
						<th>Id</th>
						<th>Title</th>
						<th>Description</th>
						<th>Release Year</th>

					</tr>
				</thead>
				<tbody>

					<tr>

						<td>${film.id}</td>
						<td>${film.title}</td>
						<td>${film.description}</td>
						<td>${film.releaseYear}</td>


					</tr>

				</tbody>
			</table>
			<br>

			<c:choose>

				<c:when test="${empty actors}">
					<h3>No actors were found found</h3>
				</c:when>

				<c:otherwise>
					<table>
						<thead>
							<tr>
								<th>Actors</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="actors" items="${actors}">

								<tr>

									<td>${actors.id} ${actors.firstName} ${actors.lastName}</td>

								</tr>

							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>



		</c:otherwise>


	</c:choose>




</body>
</html>