package com.techelevator.dao;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.DAOIntegrationTest;
import com.techelevator.model.Weather;

import org.junit.Assert;

public class JDBCWeatherDAOIntegrationTest extends DAOIntegrationTest{

	private JDBCWeatherDao weatherDao;
	private JdbcTemplate jdbc;
	
	@Before
	public void setup() {
		jdbc = new JdbcTemplate(super.getDataSource());
		weatherDao = new JDBCWeatherDao(super.getDataSource());
	}
	
	@Test
	public void get_weather_by_park_code() {
		
		String insertSql = "INSERT INTO park "
				+ " VALUES ('ABC', 'abcd', 'OH', 5, 12, 11, 4, 'onfire', 2010, 203,"
				+ " 'help i am on fire', 'jake', 'a fun place for families', 12, 33)";
		
		jdbc.update(insertSql);
		
		String sql = "insert into weather values ('ABC', 1, 27, 40, 'snow')";
		jdbc.update(sql);
		List<Weather> weatherList = weatherDao.getWeatherByParkCode("ABC");
		
		Assert.assertTrue(weatherList.size() > 0); // Assert the size of returned list is greater than zero.
		
		for (Weather weather : weatherList) {
			if (weather.getParkCode().equals("ABC")) {
				AssertWeather(weather);
			}
		}		
	}  

	private void AssertWeather(Weather weather) {
		Assert.assertTrue(weather.getFiveDayForecastValue() == 1);
		Assert.assertTrue(weather.getLow() == 27);
		Assert.assertTrue(weather.getHigh() == 40);
		Assert.assertTrue(weather.getForecast().equals("snow"));
		
	}
	
}
