package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Weather;

public interface WeatherDao {

public List<Weather> getWeatherByParkCode(String parkCode);
}
