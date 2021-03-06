package com.skilldistillery.film.dao;

import org.springframework.stereotype.Component;

import com.skilldistillery.film.entities.Film;

@Component
public class FilmDAOJdbcImpl implements FilmDAO {

	@Override
	public Film findFilmById(int filmId) {
		return null;
	}

}
