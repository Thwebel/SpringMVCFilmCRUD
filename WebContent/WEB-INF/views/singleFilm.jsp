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
			<h3>No Film Was Found With Id Number: ${idNum}.</h3>
		</c:when>

		<c:otherwise>
			<table>
				<thead>
					<tr>
						<th>Id</th>
						<th>Title</th>
						<th>Description</th>
						<th>Release Year</th>
						<th>Language</th>
						<th>Rental Duration</th>
						<th>Rental Rate</th>
						<th>Length</th>
						<th>Rating</th>
						<th>Special Features</th>

					</tr>
				</thead>
				<tbody>

					<tr>

						<td>${film.id}</td>
						<td>${film.title}</td>
						<td>${film.description}</td>
						<td>${film.releaseYear}</td>
						<td>${film.language}</td>
						<td>${film.rentalDuration}</td>
						<td>${film.rentalRate}</td>
						<td>${film.length}</td>
						<td>${film.rating}</td>
						<td>${film.specialFeatures}</td>


					</tr>

				</tbody>
			</table>
			<br>

			<c:choose>

				<c:when test="${empty actors}">
					<h3>No actors were found</h3>
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
           <br>
            <c:choose>

				<c:when test="${empty category}">
					<h3>No categories were found</h3>
				</c:when>

				<c:otherwise>
					<table>
						<thead>
							<tr>
								<th>Category</th>
							</tr>
						</thead>
						<tbody>
								<tr>

									<td>${category.name}</td>

								</tr>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
			
			<form action="EditFilm.do" method="GET">
				<input type="hidden" name="ID" value="${film.id}"/> 
				<input type="submit" value="Update" />
			</form>
			<form action="DeleteFilm.do" method="GET">
				<input type="hidden" name="ID" value="${film.id}"/> 
				<input type="submit" value="Delete" onclick="return confirm('Are you sure? This CANNOT be undone.'); "/>
			</form>


		</c:otherwise>


	</c:choose>




</body>
</html>