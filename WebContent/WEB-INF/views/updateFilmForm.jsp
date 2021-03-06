<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>Update A Film</title>
<style>
    .create-form{
        margin: 50px;        
    }
</style>
</head>

<body>
<div class="create-form">
<h1>Enter Film Information Here!</h1>
	<form action="UpdateFilm.do" method="POST">
	
		<div class="form-group">
		<!-- text -->
		<input type="hidden" name="id" value="${film.id}" required/> 
		</div>
		<div class="form-group">
		<!-- text -->
		<label for="title">Title</label>
		<input type="text" name="title" value="${film.title}" size="15" placeholder="Title" required/> 
		</div>
		<!-- large text -->
		<div class="form-group">
		<label for="inputDescription">Description</label>
		<input type="text" name="description" value="${film.description}" size="50" placeholder="Description" required/> 
		</div>
		
		<div class="form-group">
		<!-- drop down -->
		<label for="releaseYear">Release Year</label>
		<fmt:parseNumber var = "year" type = "number" value = "${film.releaseYear}" />
		<input type="Number" name="releaseYear" value="${year}" min="1920" max="2021" size="6" placeholder="Year" required/> 
		</div>
		
		<div class="form-group">
		<!-- drop down -->
		<label for="languageId">Language</label>
		<select name="languageId" id="languageId">
			<option value=1>English</option>
			<option value=2>Italian</option>
			<option value=3>Japanese</option>
			<option value=4>Mandarin</option>
			<option value=5>French</option>
			<option value=6>German</option>
		</select>
		</div>
		
		<div class="form-group">
		<!--time?  -->
		<label for="rentalDuration">Rental Duration</label>
		<fmt:parseNumber var = "duration" type = "number" value = "${film.rentalDuration}" />
		<input type="number" name="rentalDuration" value="${duration}" min="0" max="10" size="4" placeholder="Title" required/> 
		</div>
		
		<div class="form-group">
		<!-- drop down rates -->
		<label for="rentalRate">Rental Rate</label>
		<fmt:parseNumber var = "rentRate" type = "number" value = "${film.rentalRate}" />
		<input type="number" name="rentalRate" value="${rentRate}" min="0" max="100" step=0.01 placeholder="Price" required/> 
		</div>
		
		<div class="form-group">
		<!-- in min -->
		<label for="length">Film Length in Minutes</label>
		<fmt:parseNumber var = "length" type = "number" value = "${film.length}" />
		<input type="number" name="length" value="${length}" min="0" max="1000" placeholder="RunTime" required/> 
		</div>
		
		<div class="form-group">
		<!-- replacement -->
		<label for="replacementCost">Cost to Replace</label>
		<fmt:parseNumber var = "cost" type = "number" value = "${film.replacementCost}" />
		<input type="number" name="replacementCost" value="${cost}" min="0" max="100" step=0.01 placeholder="Cost" size="4" required/> 
		</div>
		
		<div class="form-group">
		<!-- drop down -->
		
		<label for="rating">Rating</label>
		<select name="rating" id="rating">
			<option value="G">G</option>
			<option value="PG">PG</option>
			<option value="PG13">PG-13</option>
			<option value="R">R</option>
			<option value="NC17">NC-17</option>
		</select>
		</div>
		
		<div class="form-group">
		<!-- check box -->
		  <h5><strong>Special Features</strong></h5><br>
		  <input type="checkbox" id="Commentaries" name="specialFeatures" value="Commentaries">
		  <label for="Commentaries">Commentaries</label><br>
		
		  <input type="checkbox" id="DeletedScenes" name="specialFeatures" value="Deleted Scenes">
		  <label for="DeletedScenes"> Deleted Scenes</label><br>
		  
		  <input type="checkbox" id="BehindScenes" name="specialFeatures" value="Behind the Scenes">
		  <label for="BehindScenes">Behind the Scenes</label>
		  
		  <input type="checkbox" id="Trailers" name="specialFeatures" value="Trailers">
		  <label for="Trailers">Trailers</label>
		  
		</div>
		
		<button type="submit" class="btn btn-primary">Create</button>
			
			
			
	</form>

	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>