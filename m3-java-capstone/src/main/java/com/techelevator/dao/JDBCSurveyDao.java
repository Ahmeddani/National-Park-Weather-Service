package com.techelevator.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Park;
import com.techelevator.model.Survey;

@Component
public class JDBCSurveyDao implements SurveyDao{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCSurveyDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Autowired
	private ParkDao parkDao;
	
	@Override
	public Map<Park, Integer> getFavoriteParksByNumberOfSurveys() {
		Map<Park, Integer> favoriteParksMap = new HashMap<Park, Integer>();
		String sqlSelectFavoriteParks = "select parkcode, count(*) from survey GROUP by parkcode order by count desc, parkcode";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSelectFavoriteParks);
		while (result.next()) {
			Park park = parkDao.getParkById(result.getString("parkcode"));
			String parkCode = park.getParkCode().toLowerCase();
			park.setParkCode(parkCode);
			favoriteParksMap.put(park, result.getInt("count"));
			
		}
		return favoriteParksMap;
	}

	@Override
	public void saveSurvey(Survey survey) {
		
		String sqlInsertSurvey = "Insert into survey_result (parkcode, emailaddress, state, activitylevel) values (?, ?, ?, ?)";
		jdbcTemplate.update(sqlInsertSurvey, survey.getParkCode(), survey.getEmail(), survey.getState(), survey.getActivityLevel());
	}
}
