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

	@RequestMapping(path = { "/", "home.do" })
	public String home() {
		return "WEB-INF/views/index.jsp";
	}

	@RequestMapping(path = "GetFilm.do", params = "ID", method = RequestMethod.GET)
	public ModelAndView findFilmById(String ID) {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("WEB-INF/views/singleFilm.jsp");
		try {
			mv.addObject("film", filmDAO.findFilmById(Integer.parseInt(ID)));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return mv;
	}

	@RequestMapping(path = { "GetActors.do" }, params = "ID", method = RequestMethod.GET)
	public ModelAndView findActorById(int ID) {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("WEB-INF/views/singleFilm.jsp");
		try {
			mv.addObject("actors", filmDAO.findActorById(ID));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return mv;
	}

	@RequestMapping(path = { "GetActors.do" }, params = "filmId", method = RequestMethod.GET)
	public ModelAndView findActorsByFilmId(int filmId) {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("WEB-INF/views/singleFilm.jsp");
		try {
			mv.addObject("actors", filmDAO.findActorById(filmId));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return mv;
	}

	@RequestMapping(path = "GetFilm.do", params = "keyword", method = RequestMethod.GET)
	public ModelAndView findFilmByKeyword(String keyword) {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("WEB-INF/views/results.jsp");
		try {
			mv.addObject("film", filmDAO.findFilmByKeyword("%" + keyword + "%"));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return mv;
	}
	@RequestMapping(path="GetForm.do")
	public String getForm() {
		return "WEB-INF/views/createFilmForm.jsp";
	}

}









