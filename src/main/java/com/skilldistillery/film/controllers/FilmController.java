package com.skilldistillery.film.controllers;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.film.dao.FilmDAO;
import com.skilldistillery.film.entities.Film;

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
		mv.addObject("idNum", Integer.valueOf(ID));
		mv.setViewName("WEB-INF/views/singleFilm.jsp");
		try {
			mv.addObject("film", filmDAO.findFilmById(Integer.parseInt(ID)));
			mv.addObject("actors", filmDAO.findActorsByFilmId(Integer.parseInt(ID)));
			mv.addObject("category",filmDAO.findCategoriesByFilmId(Integer.parseInt(ID)));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return mv;
	}
	
	@RequestMapping(path = "EditFilm.do", params = "ID", method = RequestMethod.GET)
	public ModelAndView getUpdateForm(int ID) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("idNum", Integer.valueOf(ID));
		try {
			mv.addObject("film", filmDAO.findFilmById(ID));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		mv.setViewName("WEB-INF/views/updateFilmForm.jsp");
		
		return mv;
	}
	
	@RequestMapping(path="UpdateFilm.do",
			method = RequestMethod.POST)
	public ModelAndView updateFilm(Film film, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		
		filmDAO.updateFilm(film);
		
		redir.addFlashAttribute("film", film);
		mv.setViewName("redirect:filmCreated.do");
		
		return mv;
	}

//	@RequestMapping(path = { "GetActors.do" }, params = "ID", method = RequestMethod.GET)
//	public ModelAndView findActorById(int ID) {
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("WEB-INF/views/singleFilm.jsp");
//		try {
//			mv.addObject("actors", filmDAO.findActorById(ID));
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//
//		return mv;
//	}

//	@RequestMapping(path = { "GetFilm.do" }, params = "filmId", method = RequestMethod.GET)
//	public ModelAndView findActorsByFilmId(int filmId) {
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("WEB-INF/views/singleFilm.jsp");
//		try {
//			mv.addObject("actors", filmDAO.findActorById(filmId));
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//
//		return mv;
//	}

	@RequestMapping(path = "GetFilm.do", params = "keyword", method = RequestMethod.GET)
	public ModelAndView findFilmByKeyword(String keyword) {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("WEB-INF/views/results.jsp");
		try {
			mv.addObject("films", filmDAO.findFilmByKeyword(keyword));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return mv;
	}
	
	@RequestMapping(path="GetForm.do")
	public String getForm() {
		return "WEB-INF/views/createFilmForm.jsp";
	}
	
	@RequestMapping(path="MakeFilm.do",
			method = RequestMethod.POST)
	public ModelAndView newFilm(Film film, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		
		filmDAO.createFilm(film);
		
		redir.addFlashAttribute("film", film);
		mv.setViewName("redirect:filmCreated.do");
		
		return mv;
	}

	@RequestMapping(path = "filmCreated.do", 
			method = RequestMethod.GET)
	public ModelAndView filmCreated() {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("WEB-INF/views/singleFilm.jsp");
		
		return mv;
	}
	
	
	@RequestMapping(path = "DeleteFilm.do",  params = "ID",
			method = RequestMethod.GET)
	public ModelAndView deleteFilm(String ID) {
		
		Film film = null;
		try {
			film = filmDAO.findFilmById(Integer.parseInt(ID));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("WEB-INF/views/filmDeleted.jsp");
		mv.addObject("deleted", filmDAO.deleteFilm(film));
		mv.addObject("film", film);
		
		return mv;
	}
	
	
}









