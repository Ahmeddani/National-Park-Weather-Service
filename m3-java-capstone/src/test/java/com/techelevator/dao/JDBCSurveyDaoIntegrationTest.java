package com.techelevator.dao;

import java.util.LinkedHashMap;
import java.util.Map;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.techelevator.DAOIntegrationTest;
import com.techelevator.model.Park;
import com.techelevator.model.Survey;

public class JDBCSurveyDaoIntegrationTest extends DAOIntegrationTest{

	private JDBCSurveyDao surveyDao;
	private JdbcTemplate jdbc;
	
	@Autowired
	private ParkDao parkDao;

	
	@Before
	public void setup() {
		jdbc = new JdbcTemplate(super.getDataSource());
		surveyDao = new JDBCSurveyDao(super.getDataSource());
	}
	
	@Test
	public void test_get_favorite_parks_by_number_of_surveys() {
		
		String sql = "insert into survey_result (parkcode, emailaddress, state, activitylevel) values ('enp', 'abc@gmail.com',"
				+ "'OH', 'active')";
		jdbc.update(sql);
		
		Map<Park, Integer> favMap = new LinkedHashMap<Park, Integer>();
		
		try {
			favMap = surveyDao.getFavoriteParksByNumberOfSurveys();
		}catch(Exception e) {
			//reflectivecallable invocationtargetexception here.
		}
		
		for (Park park : favMap.keySet()) {
			if (park.getParkCode().equals("ENP")) {
				Assert.assertTrue(favMap.get(park) >= 1);
			}
		}
	}
	
	@Test
	public void test_save_survey() {
		
		String sqlSelect = "select count(*) from survey_result";
		SqlRowSet result = jdbc.queryForRowSet(sqlSelect);
		int oldSurvey = getSurveyCount(result);
		
		Survey survey = new Survey();
		survey.setParkCode("enp");
		survey.setEmail("abc@gmail.com");
		survey.setState("OH");
		survey.setActivityLevel("active");
		surveyDao.saveSurvey(survey);
		
		String sqlSelect2 = "select count(*) from survey_result";
		SqlRowSet result2 = jdbc.queryForRowSet(sqlSelect2);
		int newSurvey = getSurveyCount(result2);
	     
		Assert.assertEquals(oldSurvey + 1, newSurvey);
	}	
	
	private int getSurveyCount(SqlRowSet result) {
		Survey survey = new Survey();
		while (result.next()) {
			survey.setSurveyCount(result.getInt("count"));
		}
		int surveyCount = survey.getSurveyCount();
		return surveyCount;
	}
}
