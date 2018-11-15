package com.techelevator.model;

import javax.validation.Valid;

import org.hibernate.validator.constraints.NotBlank;

public class Survey {


private int surveyId;

private String parkCode;
@NotBlank(message = "Email is required")
@Valid
private String email;

@NotBlank(message = "Email is required")
private String state;
private String activityLevel;
private int surveyCount;
public int getSurveyId() {
	return surveyId;
}
public void setSurveyId(int surveyId) {
	this.surveyId = surveyId;
}
public String getParkCode() {
	return parkCode;
}
public void setParkCode(String parkCode) {
	this.parkCode = parkCode;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getActivityLevel() {
	return activityLevel;
}
public void setActivityLevel(String activityLevel) {
	this.activityLevel = activityLevel;
}
public int getSurveyCount() {
	return surveyCount;
}
public void setSurveyCount(int surveyCount) {
	this.surveyCount = surveyCount;
}


}
