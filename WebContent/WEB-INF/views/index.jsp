<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC Film Site</title>
</head>
<body>

	<h1>Welcome to the Film Site</h1>

	<h3>Look up film by Id</h3>
	<form action="GetFilm.do" method="GET">
		<input type="text" name="ID" value="" size="4" /> <input
			type="submit" value="Search" />
	</form>

	<h3>Add a Film to the DataBase</h3>
	
	<form action="GetForm.do" method="GET">
		<input type="submit" value="Add Film" />
	</form>

	<h3>Edit a Film in the DataBase</h3>
	
	<form action="EditFilm.do" method="GET">
		<input type="number" min="1" max="2000" name="ID" value="" size="4" id="number" required /> 
		<label for="number" >Film ID</label>
		<input type="submit" value="Update" />
	</form>

	<!-- <h3>See All Films</h3>

	<form action="https://google.com">
		<input type="submit" value="Go to Google" />
	</form> -->


</body>
</html>