<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
	<head>
    	<meta charset="UTF-8">
    	<c:url value="/css/park.css" var="cssHref" />
    	<link rel="stylesheet" href="${cssHref}">
	</head>

<body>
	<header>
		<c:url value="/" var="homePageHref" />
		<a href="${homePageHref}">
			<img src="img/logo.png" alt="national park logo" style="width:500px; height:150px;"/>
		</a>
	</header>
	
		<nav>
			<ul>
				<li><a href="home">Home</a></li>
        		<li><a href="survey">Survey</a></li>
			</ul>
		</nav>
	<br>
	<section id="main-content">
