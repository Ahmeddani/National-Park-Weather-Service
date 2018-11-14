package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Park;

public interface ParkDao {

public List<Park> getAllParks();
	
	public Park getParkById(String parkCode);
	
}
