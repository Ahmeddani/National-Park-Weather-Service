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

<c:forEach var = "park" items = "${favoriteParks}">

	<div>
		<img alt="park image" src="img/parks/${park.key.parkCode}.jsp">
	
	</div>
	<div>
		<h3><c:out value="${park.key.parkName}"></c:out></h3>
	
	</div>
	<div>
		<c:out value="${park.value}"></c:out>
	
	</div>
</c:forEach>
</body>
</html>