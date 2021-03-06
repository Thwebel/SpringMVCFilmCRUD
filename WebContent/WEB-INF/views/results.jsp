<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Films</title>
</head>
<body>

	<c:choose>
		<c:when test="${empty films}">
			<h3>No films were found</h3>
		</c:when>

		<c:otherwise>
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>Title</th>
					</tr>

				</thead>
				<tbody></tbody>
				<c:forEach var="films" items="${films}">

					<tr>
						<td>${films.id}</td>
						<td><a href="GetFilm.do?ID=${films.id}">${films.title}</a></td>

					</tr>
					<form action="EditFilm.do" method="GET">
						<input type="text" name="ID" value="${films.id}" size="4" /> <input
							type="submit" value="Update" />
					</form>

				</c:forEach>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>




</body>
</html>