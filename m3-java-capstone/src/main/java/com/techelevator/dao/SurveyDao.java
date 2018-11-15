package com.techelevator.dao;

import java.util.List;
import java.util.Map;

import com.techelevator.model.Park;
import com.techelevator.model.Survey;

public interface SurveyDao {

public Map<Park, Integer> getFavoriteParksByNumberOfSurveys();
public void saveSurvey(Survey survey);
}
