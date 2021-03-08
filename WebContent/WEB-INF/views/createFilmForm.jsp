<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="resources/FilmQueryStyle.css" type="text/css">
<title>Create A Film</title>

</head>

<body>

 <div class="header">

    <h1>Film Query Application</h1>

    <hr width="90%" color="#85adad">

    <h2>Create Film</h2>

  </div>

  <ul>
    <li><a href="home.do"><h2 class="customHome">Home</h2></a></li>
  </ul>

<div class="create-form">
<h2>Enter Film Information Here!</h2>
	<form action="MakeFilm.do" method="POST">
	
		<div class="form-group">
		<!-- text -->
		<label for="title">Title</label>
		<input class="customInputText" id="title" type="text" name="title" value="" size="15" placeholder="Title" required/> 
		</div>
		<!-- large text -->
		<div class="form-group">
		<label for="inputDescription">Description</label>
		<input class="customInputText" id="inputDescription" type="text" name="description" value="" size="4" placeholder="Description" required/> 
		</div>
		
		<div class="form-group">
		<!-- drop down -->
		<label for="releaseYear">Release Year</label>
		<input type="Number" name="releaseYear" id="releaseYear" min="1920" max="2021" size="6" placeholder="Year" required/> 
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
		<label for="rentalDuration">Rental Duration in Days</label>
		<input type="number" name="rentalDuration" id="rentalDuration" min="0" max="10" size="4" placeholder="Title" required/> 
		</div>
		
		<div class="form-group">
		<!-- drop down rates -->
		<label for="rentalRate">Rental Rate</label>
		<input type="number" name="rentalRate" id="rentalRate" min="0" max="100" step=0.01 placeholder="Price" required/> 
		</div>
		
		<div class="form-group">
		<!-- in min -->
		<label for="length">Film Length in Minutes</label>
		<input type="number" name="length" id="length" min="0" max="1000" placeholder="RunTime" required/> 
		</div>
		
		<div class="form-group">
		<!-- replacement -->
		<label for="replacementCost">Cost to Replace</label>
		<input type="text" name="replacementCost" id="replacementCost" min="0" max="100" step=0.01 placeholder="Cost" size="4" required/> 
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
		
		<br>
		<hr>
		<br>
		
		<div class="form-group">
		<!-- check box -->
		  <h4><strong>Special Features</strong></h4>
		  <input type="checkbox" id="Commentaries" name="specialFeatures" value="Commentaries">
		  <label for="Commentaries">Commentaries</label><br>
		
		  <input type="checkbox" id="DeletedScenes" name="specialFeatures" value="Deleted Scenes">
		  <label for="DeletedScenes"> Deleted Scenes</label><br>
		  
		  <input type="checkbox" id="BehindScenes" name="specialFeatures" value="Behind the Scenes">
		  <label for="BehindScenes">Behind the Scenes</label>
		  
		  <input type="checkbox" id="Trailers" name="specialFeatures" value="Trailers">
		  <label for="Trailers">Trailers</label>
		  
		</div>
		<br>
		<hr>
		<br>
		
		<button type="submit" class="niceButton">Create</button>
			
			
			
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
<!--
	private int id;
	private String title;
	private String description;
	private String releaseYear;
	private int languageId;
	private int rentalDuration;
	private double rentalRate;
	private Integer length;
	private double replacementCost;
	private String rating;
	private String specialFeatures;
	private String language;
	private List<Actor> actors;
	private List<Film> films; -->