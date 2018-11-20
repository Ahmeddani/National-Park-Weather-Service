<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:import url="/WEB-INF/common/header.jsp" />


	<div id="surveyhead">
		<c:set var="confirmarionURL" value="/favoriteParksPage"/>
		<h1>Today's Survey: What is Your Favorite National Park?</h1>
		<br>
		<p>Today's survey is brought to you by the dark lord himself. 
		We will patiently wait to hear your opinion on which park enjoy frequenting the most in exchange for your personal information. 
		Yes, we will sell it and by entering your information you are agreeing to give your soul to Satan. 
		National Park Geek is not responsible for any damages done to any users of this site. 
		Thank you and see you tomorrow for the next survey! </p>
		<br>
		
	<div>	
		<form:form action = "${confirmationURL}" method = "POST" modelAttribute="survey">
				  
			<form:select path="parkCode">
				<form:option value="Cuyahoga Valley National Park">Cuyahoga Valley National Park</form:option>
				<form:option value="Everglades National Park">Everglades National Park</form:option>
				<form:option value="Grand Canyon National Park">Grand Canyon National Park</form:option>
				<form:option value="Glacier National Park">Glacier National Park</form:option>
				<form:option value="Great Smoky Mountains National Park">Great Smoky Mountains National Park</form:option>
				<form:option value="Grand Teton National Park">Grand Teton National Park</form:option>
				<form:option value="Mount Rainier National Park">Mount Rainier National Park</form:option>
				<form:option value="Rocky Mountain National Park">Rocky Mountain National Park</form:option>
				<form:option value="Yellowstone National Park">Yellowstone National Park</form:option>
				<form:option value="Yosemite National Park">Yosemite National Park</form:option>
			</form:select>
			<br>
			<br>
			<label for="email">Email</label>
			<form:input path="email" /> 
			<form:errors path = "email" cssClass="error"/>
			<br>
			<br>
			<label for="state">State of Residence</label>
			<form:select path="state">
                  <form:options items="${stateList}"/>
            </form:select>
			<br>
			<br>
			<form:radiobutton path="activityLevel" value="inactive"/>Inactive
            <form:radiobutton path="activityLevel" value="sedentary"/>Sedentary 
            <form:radiobutton path="activityLevel" value="active"/>Active
            <form:radiobutton path="activityLevel" value="extremely Active"/>Extremely Active
            <br>
            <br>
            <div id="votes">
				<form:button value = "submit">Submit</form:button>
			</div>
			</form:form>
	</div>
</div>
<c:import url="/WEB-INF/common/footer.jsp" />