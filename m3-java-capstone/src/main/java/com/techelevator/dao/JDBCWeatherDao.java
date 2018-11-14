package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Weather;

@Component
public class JDBCWeatherDao implements WeatherDao{

	private JdbcTemplate jdbcTemplate;
	@Autowired
	public JDBCWeatherDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Weather> getWeatherByParkCode(String parkCode) {
		List<Weather> forecastList = new ArrayList<>();
		String sqlSelectWeather = "select * from weather where parkcode = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlSelectWeather, parkCode);
		
		while (result.next()) {
			forecastList.add(mapRowToWeather(result));
		}
		
		return forecastList;
	}

	private Weather mapRowToWeather(SqlRowSet result) {
		Weather weather = new Weather();
		weather.setParkCode(result.getString("parkcode"));
		weather.setLow(result.getInt("low"));
		weather.setHigh(result.getInt("high"));
		weather.setFiveDayForcastValue(result.getInt("fivedayforecastvalue"));
		weather.setForecast(result.getString("forecast"));
		return weather;
	}

}
