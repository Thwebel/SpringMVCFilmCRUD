<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Film</title>
</head>
<body>

<c:choose>
   <c:when test="${not deleted}">
   <h3>The film was not deleted</h3>
   </c:when>

   <c:otherwise>
   <h3>Film ${film.title} was successfully deleted</h3>
   </c:otherwise>




</c:choose>

</body>
</html>