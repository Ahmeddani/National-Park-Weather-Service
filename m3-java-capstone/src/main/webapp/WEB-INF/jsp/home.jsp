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
<c:set var="detailPageURL" value="/detailPage"/>
 

 <form action = "${detailPageURL}" method = "GET">
	
	<c:forEach var = "park" items = "${parkList}">
	 
	  <c:url var = "detailPageURL" value = "/detailPage">
		<c:param name="id" value = "${park.parkCode}"></c:param>
	  </c:url>
		
		<div>
			 <a href= "${detailPageURL }"><img src = "img/parks/${park.parkCode}.jpg"/></a>
			 <a href= "${detailPageURL }"><c:out value="${park.parkName}"></c:out></a>
			 <c:out value="${park.state}"></c:out>
			 <c:out value="${park.parkDescription}"></c:out>
		</div>
	
	</c:forEach> 

 </form>
 </body>
</html>

