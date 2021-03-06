package com.techelevator.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
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
@SessionAttributes({"temperature", "scale"})
public class ParkController {

@Autowired
private ParkDao parkDao;

@Autowired
private WeatherDao weatherDao;

@Autowired
private SurveyDao surveyDao;

@RequestMapping(path = {"/home","/"}, method = RequestMethod.GET)
public String displayHomePage(HttpServletRequest request) {
	
	List<Park> parkList = new ArrayList<Park>();
	parkList = parkDao.getAllParks();
	request.setAttribute("parkList", parkList);
	return "home";
}

@SuppressWarnings("unchecked")
@RequestMapping(path = "/detailPage", method = RequestMethod.GET)
public String displayDetailPage(HttpServletRequest request, @RequestParam String id, ModelMap map) {
	
	Park park = new Park();
	List<Weather> forecast = weatherDao.getWeatherByParkCode(id.toUpperCase());
	if (map.containsAttribute("temperature")) {
		
		forecast = (List<Weather>) map.get("temperature");
	}
	
	park = parkDao.getParkById(id.toUpperCase());
	request.setAttribute("park", park);
	request.setAttribute("forecast", forecast);
	return "detailPage";
}

@RequestMapping(path = "/detailPage", method = RequestMethod.POST)
public String changeTemp(ModelMap map, @RequestParam String id, @RequestParam String choice) {
	

	List<Weather> forecast = weatherDao.getWeatherByParkCode(id.toUpperCase());
	String scale = "f";
	if(choice.equals("c")) {
		for(Weather weather: forecast) {
			int oldHigh = weather.getHigh();
			int oldLow = weather.getLow();
			weather.setHigh(((oldHigh-32)*5)/9);
			weather.setLow(((oldLow-32)*5)/9);
		}
		scale = "c";
	}
	
    map.addAttribute("temperature", forecast);
    map.addAttribute("scale", scale);
	return "redirect:/detailPage?id="+id;
}


@RequestMapping(path = "/survey", method = RequestMethod.GET)
public String displaySurveyPage(HttpServletRequest request, Model model) {
	
	if (!model.containsAttribute("survey")) {
		model.addAttribute("survey", new Survey());
	}
	Map<String, String> states = new LinkedHashMap<String, String>();
	states.put("AL", "Alabama");states.put("AK", "Alaska");
	states.put("AZ", "Arizona");states.put("AR", "Arkansas");states.put("CA", "California");
	states.put("CO", "Colorado");states.put("CT", "Connecticut");states.put("DE", "Delaware");
	states.put("FL", "Florida");states.put("GA", "Georgia");states.put("HI", "Hawaii");
	states.put("ID", "Idaho");states.put("IL", "Illinois");states.put("IN", "Indiana");
	states.put("IA", "Iowa");states.put("KS", "Kansas");states.put("KY", "Kentucky");
	states.put("LA", "Louisiana");states.put("ME", "Maine");states.put("MD", "Maryland");
	states.put("MA", "Massachusetts");states.put("MI", "Michigan");states.put("MN", "Minnesota");
	states.put("MS", "Mississippi");states.put("MO", "Missouri");states.put("MT", "Montana");
	states.put("NE", "Nebraska");states.put("NV", "Nevada");states.put("NH", "New Hampshire");
	states.put("NJ", "New Jersey");states.put("NM", "New Mexico");states.put("NY", "New York");
	states.put("NC", "North Carolina");states.put("ND", "North Dakota");states.put("OH", "Ohio");
	states.put("OK", "Oklahoma");states.put("OR", "Oregon");states.put("PA", "Pennsylvania");
	states.put("RI", "Rhode Island");states.put("SC", "South Carolina");states.put("SD", "South Dakota");
	states.put("TN", "Tennessee");states.put("TX", "Texas");states.put("UT", "Utah");
	states.put("VT", "Vermont");states.put("VA", "Virginia");states.put("WA", "Washington");
	states.put("WV", "West Virginia");states.put("WI", "Wisconsin");states.put("WY", "Wyoming");
	
	request.setAttribute("stateList", states);
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
	return "redirect:/favoriteParksPage";
}
@RequestMapping(path = "/favoriteParksPage", method = RequestMethod.GET)
public String displayFavoriteParks(HttpServletRequest request) {
	
	Map<Park, Integer> favoritesMap = surveyDao.getFavoriteParksByNumberOfSurveys();
	request.setAttribute("favoriteParks", favoritesMap);
	return "favoriteParksPage";
}

}
