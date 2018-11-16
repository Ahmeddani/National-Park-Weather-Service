<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/common/header.jsp" />



<c:set var="pageTitle" value="detailPage"/>

 <div class = "image">
 	<img src = "img/parks/${park.parkCode}.jpg" style="width:1000px; height:600px; padding-left:50px; border-radius: 8px;"/>
 </div>
 
 <div class = "details">
	 <h1><c:out value="${park.parkName}"></c:out></h1>
	 
	 	<strong>Park Code:</strong> <c:out value="${park.parkCode}"></c:out>
	 <br>
	 	<strong>Location:</strong> <c:out value="${park.state}"></c:out>
	 <br>
	 	<strong>Acreage:</strong> <c:out value="${park.acreage}"></c:out>
	 <br>
	 	<strong>Elevation in Feet:</strong> <c:out value="${park.elevationInFeet}"></c:out>
	 <br>
	 	<strong>Miles of Trail:</strong> <c:out value="${park.milesOfTrail}"></c:out>
	 <br>
	 	<strong>Number of Campsites:</strong> <c:out value="${park.numberOfCampsites}"></c:out>
	 <br>
	 	<strong>Climate:</strong> <c:out value="${park.climate}"></c:out>
	 <br>
	 	<strong>Year Founded:</strong> <c:out value="${park.yearFounded}"></c:out>
	 <br>
	 	<strong>Annual Visitor Count:</strong> <c:out value="${park.annualVisitorCount}"></c:out>
	 <br>
	 	<strong>Inspirational Quote:</strong> <c:out value="${park.inspirationalQuote}"></c:out>
	 	 <em>  By: <c:out value="${park.inspirationalQuoteSource}"></c:out> </em>
	 <br>
	 	<strong>Number of Animal Species:</strong> <c:out value="${park.numberOfAnimalSpecies}"></c:out>
	 <br>
	 	<strong>Park Entry Fee:</strong> $<c:out value="${park.entryFee}"></c:out>
	 <br>
	 	<strong>Park Description:</strong> <p><c:out value="${park.parkDescription}"></c:out></p>	
	 		 
 </div>
<div class="temps"><h2>FIVE DAY WEATHER FORECAST</h2></div>
 
<div class = "weather">

	<c:forEach var  = "forecast" items = "${forecast}">

	<c:choose>
		<c:when test="${forecast.fiveDayForecastValue == 1}">
	
		<div class="temps">
			<h3>TODAY</h3>
	   		<c:choose>
				<c:when test="${forecast.forecast == 'partly cloudy'}">
					<img src = "img/weather/partlyCloudy.png" class="todaypic"/>
				</c:when>
				<c:otherwise>
		 			<img src = "img/weather/${forecast.forecast}.png" class="todaypic"/>
				</c:otherwise>
			</c:choose>
			
			<div class="temps">
				High Low
				<br>
				<c:out value = "${forecast.high}"/>
	 			<c:out value = "${forecast.low}"/>
	 		</div>
	 		
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
	 	<br>
	 	<h4>Recommendations</h4>
	 	<div id="recommend">
	 		<ul>
				<li><c:out value="${recommendation}"></c:out></li>
				<li><c:out value="${recommendation2}"></c:out></li>
			</ul>
		</div>
	</div>
	</c:when>
	
	<c:otherwise>
		<div>
		<c:choose>
			<c:when test="${forecast.forecast == 'partly cloudy'}">
				<img src = "img/weather/partlyCloudy.png" class="otherDayPic"/>
			</c:when>
			
			<c:otherwise>
		 		<img src = "img/weather/${forecast.forecast}.png" class="otherDayPic"/>
			</c:otherwise>
		</c:choose>
		<br>
		<div class="temps">
			High Low
			<br>
			<c:out value = "${forecast.high}"/>
			<c:out value = "${forecast.low}"/>
		</div>
		</div>
	</c:otherwise>
	
	</c:choose>

	</c:forEach>
</div>

<div class="convert">
	<form action="detailPage" method = "POST">
	<input type="hidden" name="id" id="id" value="${park.parkCode}" />
	
	<br>
	<label for="choice">Fahrenheit / Celcius? : </label>
	<select name = "choice" id = "choice">
 		<option value = "f">Fahrenheit</option>
  		<option value = "c">Celsius</option>
	</select>

	<input type = "submit" name = "submit" value = "Change Temp"/>
	</form>
</div>

<c:import url="/WEB-INF/common/footer.jsp" />