package com.skilldistillery.film.dao;

import java.sql.SQLException;
import java.util.List;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Category;
import com.skilldistillery.film.entities.Film;

public interface FilmDAO {

	
	 public Film findFilmById(int filmId);
//	  public Actor findActorById(int actorId)throws SQLException;
	  public List<Actor> findActorsByFilmId(int filmId);
	  public List<Film> findFilmByKeyword(String keyword) throws SQLException;
	  public Film createFilm(Film film);
	  public boolean deleteFilm(Film film);
	  public boolean updateFilm(Film film);
	  public Category findCategoriesByFilmId(int filmId);
	
	
}
