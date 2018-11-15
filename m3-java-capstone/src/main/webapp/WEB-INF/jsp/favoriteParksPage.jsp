<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/common/header.jsp" />


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

<c:import url="/WEB-INF/common/footer.jsp" />