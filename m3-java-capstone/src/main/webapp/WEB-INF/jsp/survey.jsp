<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:import url="/WEB-INF/common/header.jsp" />

<div class="modal-dialog"> 
				<div class="loginmodal-container">
					<h1>Fill the survey</h1><br>
				<c:set var="confirmarionURL" value="/favoriteParksPage"/>
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
				  <label for="email">Email</label>
					<form:input path="email" /> 
					<form:errors path = "email" cssClass="error"/>
					<br>
				  <label for="state">State of Residence</label>
					<form:input path="state" /> 
					<form:errors path = "state" cssClass="error"/>
				  <br>
				 <form:radiobutton path="activityLevel" value="inactive"/>Inactive
                 <form:radiobutton path="activityLevel" value="sedentary"/>Sedentary 
                 <form:radiobutton path="activityLevel" value="active"/>Active
                 <form:radiobutton path="activityLevel" value="extremely Active"/>extremely Active
				<br>
				<form:button value = "submit">Submit</form:button>
				</form:form>
				
<c:import url="/WEB-INF/common/footer.jsp" />