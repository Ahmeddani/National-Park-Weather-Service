package com.techelevator.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.dao.ParkDao;
import com.techelevator.model.Park;

@Controller
//@SessionAttributes("temperature")
public class ParkController {

@Autowired
private ParkDao parkDao;

@RequestMapping(path = "/home", method = RequestMethod.GET)
public String displayHomePage(HttpServletRequest request) {
	
	List<Park> parkList = new ArrayList<Park>();
	parkList = parkDao.getAllParks();
	request.setAttribute("parkList", parkList);
	return "home";
}
}
