package com.skilldistillery.film.controllers;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.dao.FilmDAO;

@Controller
public class FilmController {

	@Autowired
	private FilmDAO filmDAO;
	
		@RequestMapping( path = {"/","home.do"}, params = "id", method = RequestMethod.GET )
		public ModelAndView findFilmById(int id) { 
			ModelAndView mv = new ModelAndView();        
			                                             
			mv.setViewName("WEB-INF/views/index.jsp");
			try {
				mv.addObject("films", filmDAO.findFilmById(id));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return mv;
	}
	
	
}
