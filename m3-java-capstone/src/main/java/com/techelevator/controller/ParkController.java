package com.techelevator.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.dao.ParkDao;
import com.techelevator.dao.SurveyDao;
import com.techelevator.dao.WeatherDao;
import com.techelevator.model.Park;
import com.techelevator.model.Survey;
import com.techelevator.model.Weather;


@Controller
@SessionAttributes("temperature")
public class ParkController {

@Autowired
private ParkDao parkDao;

@Autowired
private WeatherDao weatherDao;

@Autowired
private SurveyDao surveyDao;

@RequestMapping(path = "/home", method = RequestMethod.GET)
public String displayHomePage(HttpServletRequest request) {
	
	List<Park> parkList = new ArrayList<Park>();
	parkList = parkDao.getAllParks();
	request.setAttribute("parkList", parkList);
	return "home";
}

@RequestMapping(path = "/detailPage", method = RequestMethod.GET)
public String displayDetailPage(HttpServletRequest request, @RequestParam String id) {
	
	Park park = new Park();
	List<Weather> forecast = weatherDao.getWeatherByParkCode(id.toUpperCase());
	park = parkDao.getParkById(id.toUpperCase());
	request.setAttribute("park", park);
	request.setAttribute("forecast", forecast);
	return "detailPage";
}

@RequestMapping(path = "/detailPage", method = RequestMethod.POST)
public String changeTemp(ModelMap map, @RequestParam String id) {
	
	Park park = new Park();
	List<Weather> forecast = weatherDao.getWeatherByParkCode(id.toUpperCase());
	for(Weather weather: forecast) {
		int oldHigh = weather.getHigh();
		int oldLow = weather.getLow();
		weather.setHigh(((oldHigh-32)*5)/9);
		weather.setLow(((oldLow-32)*5)/9);
	}
	
    map.addAttribute("temperature", forecast);
    map.addAttribute("temperature", park);
	return "m3-java-capstone/detailPage";
}

@RequestMapping(path = "/survey", method = RequestMethod.GET)
public String displaySurveyPage(HttpServletRequest request, Model model) {
	
	if (!model.containsAttribute("survey")) {
		model.addAttribute("survey", new Survey());
	}
	return "survey";
}

@RequestMapping(path = "/survey", method = RequestMethod.POST)
public String validateSurvey(@Valid @ModelAttribute("survey") Survey survey, BindingResult result, RedirectAttributes attr,
		@RequestParam (name = "parkCode") String parkName, @RequestParam String email, @RequestParam String state, @RequestParam String activityLevel) {
	
	if (result.hasErrors()) {
		return "survey";
	}
	survey = new Survey();
	Park park = parkDao.getParkByName(parkName);
	survey.setParkCode(park.getParkCode());
	survey.setEmail(email);
	survey.setState(state);
	survey.setActivityLevel(activityLevel);
	
	surveyDao.saveSurvey(survey);
	return "favoriteParksPage";
}
@RequestMapping(path = "/favoriteParksPage", method = RequestMethod.GET)
public String displayFavoriteParks(HttpServletRequest request) {
	
	Map<Park, Integer> favoritesMap = surveyDao.getFavoriteParksByNumberOfSurveys();
	request.setAttribute("favoriteParks", favoritesMap);
	return "favoriteParksPage";
}

}
