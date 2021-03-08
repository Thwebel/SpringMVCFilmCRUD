<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="resources/FilmQueryStyle.css" type="text/css">
<title>Films</title>
</head>
<body>
<div class="header">

    <h1>Film Query Application</h1>

    <hr width="90%" color="#85adad">

    <h2>Search</h2>

  </div>

  <ul>
    <li><a href="home.do"><h2 class="customHome">Home</h2></a></li>
  </ul>
	<c:choose>
		<c:when test="${empty films}">
			<h3>No films were found</h3>
		</c:when>

		<c:otherwise>
			<table class="center">
				<thead>
					<tr>
						<th>ID</th>
						<th>Title</th>
					</tr>
					
				</thead>
				
				<tbody>

				</tbody>
				<c:forEach var="films" items="${films}">

					<tr>
						<td>${films.id}</td>
						<td><a class="aBlack" href="GetFilm.do?ID=${films.id}"><h3>${films.title}</h3></a></td>
						<td>
							<form action="EditFilm.do" method="GET">
								<input type="hidden" name="ID" value="${films.id}" /> 
								<input type="submit" value="Update" />
							</form>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>




</body>
</html>