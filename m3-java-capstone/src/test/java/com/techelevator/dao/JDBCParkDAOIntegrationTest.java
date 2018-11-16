package com.techelevator.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.DAOIntegrationTest;
import com.techelevator.dao.JDBCParkDao;
import com.techelevator.model.Park;

public class JDBCParkDAOIntegrationTest extends DAOIntegrationTest{
	
	private JDBCParkDao parkDao;
	private JdbcTemplate jdbc;
	
	@Before
	public void setup() {
		jdbc = new JdbcTemplate(super.getDataSource());
		parkDao = new JDBCParkDao(super.getDataSource());
	}
	
	@Test
	public void test_get_all_parks() {
		//ARRANGE -- Insert park
		String insertSql = "INSERT INTO park "
									+ " VALUES ('abc', 'abcd', 'OH', 5, 12, 11, 4, 'onfire', 2010, 203,"
									+ " 'help i am on fire', 'jake', 'a fun place for families', 12, 33)";
		jdbc.update(insertSql);
				
		//ACT -- Get all park
		List<Park> parks = parkDao.getAllParks();
						
		//ASSERT -- Verify we have at least 1 park
		Assert.assertTrue(parks.size() > 0);
	}
	
	@Test
	public void test_get_park_by_id() {
		
		//ARRANGE -- Insert park
		String insertSql = "INSERT INTO park "
				+ " VALUES ('abc', 'abcd', 'OH', 5, 12, 11, 4, 'onfire', 2010, 203,"
				+ " 'help i am on fire', 'jake', 'a fun place for families', 12, 33)";
		jdbc.update(insertSql);
		
		// -- get park_id from park we put into database
		Park results = parkDao.getParkById("abc");
		String parkId = results.getParkCode();
		
		//ACT -- creates new list that we populate with method being tested
		Park park = parkDao.getParkById(parkId);

		//ASSERT -- verify that the list was populated
		Assert.assertEquals(parkId, park.getParkCode());
		
	}

}
