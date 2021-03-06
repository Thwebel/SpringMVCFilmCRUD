<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create A Film</title>
</head>
<body>
	<form action="MakeFilm.do" method="POST">
		<input type="text" name="ID" value="" size="4" /> 
		<input type="text" name="title" value="" size="4" /> 
		<input type="text" name="description" value="" size="4" /> 
		<input type="text" name="releaseYear" value="" size="4" /> 
		<input type="text" name="languageID" value="" size="4" /> 
		<input type="text" name="rentalDuration" value="" size="4" /> 
		<input type="text" name="rentalRate" value="" size="4" /> 
		<input type="text" name="length" value="" size="4" /> 
		<input type="text" name="replacementCost" value="" size="4" /> 
		<input type="text" name="rating" value="" size="4" /> 
		<input type="text" name="specialFeatures" value="" size="4" /> 
		<input type="submit" value="Search" />
	</form>



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