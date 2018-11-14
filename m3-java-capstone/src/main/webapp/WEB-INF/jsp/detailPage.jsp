<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<img src="img/logo.png" alt="national park logo" style="width:350px; height:150px;"/>
<nav>
        <ul>
            <li><a href="home">Home</a></li>
            <li><a href="survey">Survey</a></li>
        </ul>
        
    </nav>
<body>
<c:set var="pageTitle" value="detailPage"/>

 <div class = "image">
 	<img src = "img/parks/${park.parkCode}.jpg" style = "width:400px; height:200px"/>
 </div>
 
	 <c:out value="${park.parkCode}"></c:out>
	 <c:out value="${park.parkName}"></c:out>
	 <c:out value="${park.state}"></c:out>
	 <c:out value="${park.acreage}"></c:out>
	 <c:out value="${park.elevationInFeet}"></c:out>
	 <c:out value="${park.milesOfTrail}"></c:out>
	 <c:out value="${park.numberOfCampsites}"></c:out>
	 <c:out value="${park.climate}"></c:out>
	 <c:out value="${park.yearFounded}"></c:out>
	 <c:out value="${park.annualVisitorCount}"></c:out>
	 <c:out value="${park.inspirationalQuote}"></c:out>
	 <c:out value="${park.inspirationalQuoteSource}"></c:out>
	 <c:out value="${park.parkDescription}"></c:out>
	 <c:out value="${park.entryFee}"></c:out>
	 <c:out value="${park.numberOfAnimalSpecies}"></c:out>			 
 
 
 
 </body>
</html>