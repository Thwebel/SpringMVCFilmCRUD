<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="resources/FilmQueryStyle.css" type="text/css">
  <title>MVC Film Site</title>
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

	<h3>Look up film by Id #</h3>
	<form action="GetFilm.do" method="GET">
		<input class="customInputNumbers" type="number" name="ID" value="" size="4" required/>
    <br>
    <input type="submit" value="Search" />
	</form>

  <hr width="90%" color="#85adad">

	<h3>Look up film by keyword</h3>
	<form action="GetFilm.do" method="GET">
		<input class="customInputText" type="text" name="keyword" value="" size="4" />
    <br>
    <input type="submit" value="Search" />
	</form>

  <hr width="90%" color="#85adad">

	<h3>Edit a Film in the DataBase</h3>

	<form action="EditFilm.do" method="GET">
    		<label for="number" >Film ID #: </label>
		<input type="number" class="customInputNumbers" min="1" max="2000" name="ID" value="" size="4" id="number" required />

    <br>
		<input type="submit" value="Update" />
	</form>

  <hr width="90%" color="#85adad">

  <h3>Add a Film to the DataBase</h3>

	<form action="GetForm.do" method="GET">
		<input type="submit" value="Add Film" />
	</form>


	<!-- <h3>See All Films</h3>

	<form action="https://google.com">
		<input type="submit" value="Go to Google" />
	</form> -->


</body>
</html>