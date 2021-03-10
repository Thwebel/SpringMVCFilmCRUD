<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="resources/FilmQueryStyle.css" type="text/css">
<title>${film.title}</title>
</head>
<body>

  <div class="header">

    <h1>Film Query Application</h1>

    <hr width="90%" color="#85adad">

    <h2>View Film</h2>

  </div>

  <ul>
    <li><a href="home.do"><h2 class="customHome">Home</h2></a></li>
  </ul>


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
						<td colspan="10">

							<hr>

						</td>
					</tr>

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
					
					<tr>
						<td colspan="10">

							<hr>

						</td>
					</tr>

					<tr>

				</tbody>
			</table>

			<c:choose>

				<c:when test="${empty film.actors or film.actors.get(0).getId() == 0}">
					<h3>No actors were found</h3>
				</c:when>

				<c:otherwise>
					<table class="center">
						<thead>
							<tr>
								<th>Actors</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="actor" items="${film.actors}">

								<tr>

									<td>${actor.id} ${actor.firstName} ${actor.lastName}</td>

								</tr>

							</c:forEach>
						</tbody>
					</table>
					<hr>
				</c:otherwise>
			</c:choose>
            <c:choose>

				<c:when test="${empty film.category}">
					<h3>No categories were found</h3>
				</c:when>

				<c:otherwise>
					<table class="center">
						<thead>
							<tr>
								<th>Category</th>
							</tr>
						</thead>
						<tbody>
								<tr>

									<td>${film.category}</td>

								</tr>
						</tbody>
					</table>
					<hr>
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