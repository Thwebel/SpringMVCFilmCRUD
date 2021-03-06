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
				<c:forEach var="films" items="${films}">

					<tr>

						<td><a href="GetFilm.do?ID=${films.id}">${films.id}
								${films.title}</a></td>

					</tr>

				</c:forEach>

			</table>
		</c:otherwise>
	</c:choose>




</body>
</html>