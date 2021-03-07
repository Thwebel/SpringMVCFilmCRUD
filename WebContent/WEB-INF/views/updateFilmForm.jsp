<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="resources/FilmQueryStyle.css" type="text/css">
<title>Update A Film</title>

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

<div class="create-form">
<c:choose>
<c:when test="${film == null}"><h3>No Film Was Found With Id Number: ${idNum}.</h3></c:when>
<c:otherwise>
<h2>Enter Film Information Here!</h2>
	<form action="UpdateFilm.do" method="POST">
	
		<div class="form-group">
		<!-- text -->
		<input type="hidden" name="id" value="${film.id}" required/> 
		</div>
		<div class="form-group">
		<!-- text -->
		<label for="title">Title</label>
		<input class="customInputText" id="title" type="text" name="title" value="${film.title}" size="15" placeholder="Title" required/> 
		</div>
		<!-- large text -->
		<div class="form-group">
		<label for="inputDescription">Description</label>
		<input class="customInputText" id="inputDescription" type="text" name="description" value="${film.description}" size="50" placeholder="Description" required/> 
		</div>
		
		<div class="form-group">
		<!-- drop down -->
		<label for="releaseYear">Release Year</label>
		<fmt:parseNumber var = "year" type = "number" value = "${film.releaseYear}" />
		<input type="Number" id="releaseYear" name="releaseYear" value="${year}" min="1920" max="2021" size="6" placeholder="Year" required/> 
		</div>
		
		<div class="form-group">
		<!-- drop down -->
		<label for="languageId">Language</label>
		<select name="languageId" id="languageId">
		
		
			<c:choose> 
				<c:when test="${film.language.contains(\"English\")}">
					<option value=1 selected>English</option>
				</c:when>
				<c:otherwise>
					<option value=1>English</option>
				</c:otherwise>
			</c:choose>
			<c:choose> 
				<c:when test="${film.language.contains(\"Italian\")}">
					<option value=2 selected>Italian</option>
				</c:when>
				<c:otherwise>
					<option value=2>Italian</option>
				</c:otherwise>
			</c:choose>
			<c:choose> 
				<c:when test="${film.language.contains(\"Japanese\")}">
					<option value=3 selected>Japanese</option>
				</c:when>
				<c:otherwise>
					<option value=3>Japanese</option>
				</c:otherwise>
			</c:choose>
			<c:choose> 
				<c:when test="${film.language.contains(\"Mandarin\")}">
					<option value=4 selected>Mandarin</option>
				</c:when>
				<c:otherwise>
					<option value=4>Mandarin</option>
				</c:otherwise>
			</c:choose>
			<c:choose> 
				<c:when test="${film.language.contains(\"French\")}">
					<option value=5 selected>French</option>
				</c:when>
				<c:otherwise>
					<option value=5>French</option>
				</c:otherwise>
			</c:choose>
			<c:choose> 
				<c:when test="${film.language.contains(\"German\")}">
					<option value=6 selected>German</option>
				</c:when>
				<c:otherwise>
					<option value=6>German</option>
				</c:otherwise>
			</c:choose>
		</select>
		
		</div>
		
		<div class="form-group">
		<!--time?  -->
		<label for="rentalDuration">Rental Duration in Days</label>
		<fmt:parseNumber var = "duration" type = "number" value = "${film.rentalDuration}" />
		<input type="number" name="rentalDuration" id="rentalDuration" value="${duration}" min="0" max="10" size="4" placeholder="Title" required/> 
		</div>
		
		<div class="form-group">
		<!-- drop down rates -->
		<label for="rentalRate">Rental Rate</label>
		<fmt:parseNumber var = "rentRate" type = "number" value = "${film.rentalRate}" />
		<input type="number" name="rentalRate" id="rentalRate" value="${rentRate}" min="0" max="100" step=0.01 placeholder="Price" required/> 
		</div>
		
		<div class="form-group">
		<!-- in min -->
		<label for="length">Film Length in Minutes</label>
		<fmt:parseNumber var = "length" type = "number" value = "${film.length}" />
		<input type="number" name="length" id="length" value="${length}" min="0" max="1000" placeholder="RunTime" required/> 
		</div>
		
		<div class="form-group">
		<!-- replacement -->
		<label for="replacementCost">Cost to Replace</label>
		<fmt:parseNumber var = "cost" type = "number" value = "${film.replacementCost}" />
		<input type="number" name="replacementCost" id="replacementCost" value="${cost}" min="0" max="100" step=0.01 placeholder="Cost" size="4" required/> 
		</div>
		
		<div class="form-group">
		<!-- drop down -->
		
		<label for="rating">Rating</label>
		<select name="rating" id="rating">
			<c:choose> 
				<c:when test="${film.rating.contains(\"G\")}">
					<option value="G" selected>G</option>
				</c:when>
				<c:otherwise>
					<option value="G">G</option>
				</c:otherwise>
			</c:choose>
			
			<c:choose> 
				<c:when test="${film.rating.contains(\"PG\")}">
					<option value="PG" selected>PG</option>
				</c:when>
				<c:otherwise>
					<option value="PG">PG</option>
				</c:otherwise>
			</c:choose>
			
			<c:choose> 
				<c:when test="${film.rating.contains(\"PG13\")}">
					<option value="PG13" selected>PG-13</option>
				</c:when>
				<c:otherwise>
					<option value="PG13">PG-13</option>
				</c:otherwise>
			</c:choose>
			
			<c:choose> 
				<c:when test="${film.rating.contains(\"R\")}">
					<option value="R" selected>R</option>
				</c:when>
				<c:otherwise>
					<option value="R">R</option>
				</c:otherwise>
			</c:choose>
			
			<c:choose> 
				<c:when test="${film.rating.contains(\"NC17\")}">
					<option value="NC17" selected>NC-17</option>
				</c:when>
				<c:otherwise>
					<option value="NC17">NC-17</option>
				</c:otherwise>
			</c:choose>
		
		</select>
		
		</div>
		
		<div class="form-group">
		<!-- check box -->
		  <h5><strong>Special Features</strong></h5><br>
		  <c:choose>
		  
		  <c:when test="${film.specialFeatures.contains(\"Commentaries\")}">
		  
		 	 <input type="checkbox" id="Commentaries" name="specialFeatures" value="Commentaries" checked>
		 	 <label for="Commentaries">Commentaries</label><br>
		  </c:when>
		  <c:otherwise>
		  
		 	 <input type="checkbox" id="Commentaries" name="specialFeatures" value="Commentaries" >
		 	 <label for="Commentaries">Commentaries</label><br>
		  
		  </c:otherwise>
		</c:choose>
		<c:choose>
		  
		 	 <c:when test="${film.specialFeatures.contains(\"Deleted Scenes\")}">
		  
		 	  	<input type="checkbox" id="DeletedScenes" name="specialFeatures" value="Deleted Scenes" checked>
		 		<label for="DeletedScenes"> Deleted Scenes</label><br>
		 		
			  </c:when>
			  <c:otherwise>
		  
		 	 	<input type="checkbox" id="DeletedScenes" name="specialFeatures" value="Deleted Scenes">
		  		<label for="DeletedScenes"> Deleted Scenes</label><br>
		  
		 	 </c:otherwise>
		</c:choose>
		<c:choose>
		  
		 	 <c:when test="${film.specialFeatures.contains(\"Behind the Scenes\")}">
		  
		 	 	<input type="checkbox" id="BehindScenes" name="specialFeatures" value="Behind the Scenes" checked>
		  		<label for="BehindScenes">Behind the Scenes</label>
		  		
		  	</c:when>
		 	<c:otherwise>
		  
		 		<input type="checkbox" id="BehindScenes" name="specialFeatures" value="Behind the Scenes">
		  		<label for="BehindScenes">Behind the Scenes</label>
		  
		 	</c:otherwise>
		</c:choose>
		  <c:choose>
		  
		  <c:when test="${film.specialFeatures.contains(\"Trailers\")}">
		  
		 	 	<input type="checkbox" id="Trailers" name="specialFeatures" value="Trailers" checked>
		  		<label for="Trailers">Trailers</label>
		  </c:when>
		  <c:otherwise>
		  
		 		<input type="checkbox" id="Trailers" name="specialFeatures" value="Trailers">
		  		<label for="Trailers">Trailers</label>
		  
		  </c:otherwise>
		</c:choose>
		  
		</div>
		
		<button type="submit" class="btn btn-primary">Update</button>
			
			
			
	</form>

	</c:otherwise>
	</c:choose> 
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