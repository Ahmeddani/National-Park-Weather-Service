<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/common/header.jsp" />



<c:set var="pageTitle" value="detailPage"/>

 <div class = "image">
 	<img src = "img/parks/${park.parkCode}.jpg" style = "width:400px; height:200px"/>
 </div>
 <div class = "details">
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
 </div>
 <div class = "weather">

<c:forEach var  = "forecast" items = "${forecast}">

	<c:choose>
	<c:when test="${forecast.fiveDayForecastValue == 1}">
	
	<div class = "today">
	   <c:choose>
		<c:when test="${forecast.forecast == 'partly cloudy'}">
			<img src = "img/weather/partlyCloudy.png"/>
		</c:when>
		<c:otherwise>
		 	<img src = "img/weather/${forecast.forecast}.png"/>
		</c:otherwise>
	</c:choose>
	<c:out value = "${forecast.high}"/>
	 <c:out value = "${forecast.low}"/>
	 <!-- recommendations here -->
	 
	 <c:choose>
	  <c:when test="${forecast.forecast == 'snow'}">
	   <c:set var = "recommendation" value = "Pack snow shoes!"/>
	  </c:when>
	   <c:when test="${forecast.forecast == 'rain'}">
	   <c:set var = "recommendation" value = "Pack rain gear and wear waterproof shoes"/>
	  </c:when>
	   <c:when test="${forecast.forecast == 'thunderstorms'}">
	   <c:set var = "recommendation" value = "Seek shelter and avoid hiking and exposed ridges"/>
	  </c:when>
	   <c:when test="${forecast.forecast == 'sunny'}">
	   <c:set var = "recommendation" value = "Pack sunblock"/>
	  </c:when>
	   
	    <c:otherwise>
	  		<c:set var = "recommendation" value = "Wonderful weather"/>
	 	 </c:otherwise>
	 	 </c:choose>
	 	
	 	 <c:choose>
		   <c:when test="${forecast.high > 75}">
		   <c:set var = "recommendation2" value = "Bring an extra gallon of water"/>
		  </c:when>
		  <c:when test="${(forecast.high - forecast.low) > 20}">
		   <c:set var = "recommendation2" value = "Wear breathable layers"/>
		  </c:when>
		  <c:when test="${forecast.low < 20}">
		   <c:set var = "recommendation2" value = "Warning: extremely fridged temperature, exposure could be harmful!"/>
		  </c:when>
		  	<c:otherwise>
		   	<c:set var = "recommendation2" value = "enjoy!"/>
		  	</c:otherwise>
		  </c:choose>
		  	 
		  <c:if test="${scale == 'c'}">
		 	  <c:choose>
		   <c:when test="${forecast.high > 24}">
		   <c:set var = "recommendation2" value = "Bring an extra gallon of water"/>
		  </c:when>
		  <c:when test="${(forecast.high - forecast.low) > 11}">
		   <c:set var = "recommendation2" value = "Wear breathable layers"/>
		  </c:when>
		  <c:when test="${forecast.low < -6}">
		   <c:set var = "recommendation2" value = "Warning: extremely fridged temperature, exposure could be harmful!"/>
		  </c:when>
		 	 <c:otherwise>
		   	<c:set var = "recommendation2" value = "enjoy!"/>
		  	</c:otherwise>
		 	 

	 </c:choose>
	 </c:if>
	 
	 <c:out value="${recommendation }"></c:out><br>
	 <c:out value="${recommendation2 }"></c:out><br>
	</div>
	</c:when>
	<c:otherwise>
	<div class = "otherDays">
	<c:choose>
		<c:when test="${forecast.forecast == 'partly cloudy'}">
			<img src = "img/weather/partlyCloudy.png"/>
		</c:when>
		<c:otherwise>
		 	<img src = "img/weather/${forecast.forecast}.png"/>
		</c:otherwise>
	</c:choose>
	<c:out value = "${forecast.high}"/>
	 <c:out value = "${forecast.low}"/>
	 <!-- recommendations here -->
	</div>
	</c:otherwise>
	
	</c:choose>

</c:forEach>
</div>

<form action="detailPage" method = "POST">
<input type="hidden" name="id" id="id" value="${park.parkCode}" />

<label for="choice">Fahrenheit / Celcius? : </label>
<select name = "choice" id = "choice">
  <option value = "f">Fahrenheit</option>
  <option value = "c">Celsius</option>
</select>

<input type = "submit" name = "submit" value = "Change Temp"/>
</form>

<c:import url="/WEB-INF/common/footer.jsp" />