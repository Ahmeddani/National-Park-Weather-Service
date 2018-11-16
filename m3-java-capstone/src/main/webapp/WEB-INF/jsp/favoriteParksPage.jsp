<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/common/header.jsp" />
<div id="surveyhead">
	<h1>Today's Survey: What is Your Favorite National Park?</h1>
	<br>
	<p>Thank you for your submission. Today's survey was brought to you by the dark lord himself. 
		We have patiently waited to hear your opinion on which park enjoy frequenting the most in exchange for your personal information. 
		Yes, we have sold it and by entering your information you agreed to give your soul to Satan. 
		National Park Geek is not responsible for any damages done to any users of this site. 
		Thank you and see you tomorrow for the next survey! </p>
	<br>
</div>
<c:forEach var = "park" items = "${favoriteParks}">
	<div class="weather">
		<div>
			<img alt="park image" src="img/parks/${park.key.parkCode}.jpg" class="listpic">
	
		</div>
		<div id="votes">
			<h2><c:out value="${park.key.parkName}"></c:out></h2>
			<h3>VOTES:</h3>	
			<h3><c:out value="${park.value}"></c:out></h3>
	
		</div>
	</div>
</c:forEach>

<c:import url="/WEB-INF/common/footer.jsp" />