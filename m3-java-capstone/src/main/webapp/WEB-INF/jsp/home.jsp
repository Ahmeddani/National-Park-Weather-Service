<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="home"/>
<c:import url ="/WEB-INF/jsp/common/header.jspf"/>
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
<c:import url = "/WEB-INF/jsp/common/footer.jspf"/>