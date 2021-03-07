<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="resources/FilmQueryStyle.css" type="text/css">
<title>Delete Film</title>
</head>
<body>
<div class="header">

    <h1>Film Query Application</h1>

    <hr width="90%" color="#85adad">

    <h2>[beta]</h2>

  </div>

  <ul>
    <li><a href="home.do"><h2 class="customHome">Home</h2></a></li>
  </ul>
	<c:choose>

		<c:when test="${not deleted}">
			<h3>The film was not deleted</h3>
		</c:when>


		<c:otherwise>


			<c:choose>

				<c:when test="${empty film}">
					<h3>The film does not exist</h3>
				</c:when>

				<c:otherwise>

					<h3>Film ${film.title} was successfully deleted</h3>

				</c:otherwise>

			</c:choose>





		</c:otherwise>

	</c:choose>

</body>
</html>