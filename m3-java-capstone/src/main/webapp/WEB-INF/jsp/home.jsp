<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/common/header.jsp" />


<c:set var="detailPageURL" value="/detailPage"/>
 
 <form action = "${detailPageURL}" method = "GET">
	
	<c:forEach var = "park" items = "${parkList}">
	 
	  <c:url var = "detailPageURL" value = "/detailPage">
		<c:param name="id" value = "${park.parkCode}"></c:param>
	  </c:url>
		
		<div class="park">
			 <div class="parkpic">
			 	<a href= "${detailPageURL}"><img src = "img/parks/${park.parkCode}.jpg" id="park"/></a>
			 </div>
			 <div id="parkinfo">
			 	<a href= "${detailPageURL}"><h3><c:out value="${park.parkName}"></c:out></h3></a>
			 	<br>
			 	<c:out value="${park.state}"></c:out>
			 	<c:out value="${park.parkDescription}"></c:out>
			 </div>
		</div>
	
	</c:forEach> 

 </form>


<c:import url="/WEB-INF/common/footer.jsp" />