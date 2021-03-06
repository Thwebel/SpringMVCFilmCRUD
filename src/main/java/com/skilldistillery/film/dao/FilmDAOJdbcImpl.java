package com.skilldistillery.film.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

@Component
public class FilmDAOJdbcImpl implements FilmDAO {

	private static final String URL = "jdbc:mysql://localhost:3306/sdvid?useSSL=false";

	static {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	@Override
	public Film findFilmById(int filmId) throws SQLException {
		Film film = null;

		String user = "student";
		String pass = "student";
		Connection conn = DriverManager.getConnection(URL, user, pass);

		String sql = "SELECT film.id, film.title, film.release_year, film.rating , "
				+ " film.description, language.name FROM film JOIN language ON film.language_id = language.id WHERE film.id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, filmId);
		ResultSet filmResult = stmt.executeQuery();
		if (filmResult.next()) {
			film = new Film();
			film.setId(filmResult.getInt("id"));
			film.setTitle(filmResult.getString("title"));
			film.setDescription(filmResult.getString("description"));
			film.setReleaseYear(filmResult.getString("release_year"));
//	    film.setLanguageId(filmResult.getInt("language_id"));
//	    film.setRentalDuration(filmResult.getInt("rental_duration"));
//	    film.setRentalRate(filmResult.getDouble("rental_rate"));
//	    film.setLength(filmResult.getInt("length"));
//	    film.setReplacementCost(filmResult.getDouble("replacement_cost"));;
			film.setRating(filmResult.getString("rating"));
			film.setLanguage(filmResult.getNString("language.name"));
//	    film.setSpecialFeatures(filmResult.getString("special_features"));
			film.setActors(findActorsByFilmId(filmId));
		}

		filmResult.close();
		stmt.close();
		conn.close();

		return film;
	}

	@Override
	public Actor findActorById(int actorId) throws SQLException {
		Actor actor = null;

		String user = "student";
		String pass = "student";
		Connection conn = DriverManager.getConnection(URL, user, pass);

		String sql = "SELECT id, first_name, last_name FROM actor WHERE id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, actorId);
		ResultSet actorResult = stmt.executeQuery();
		if (actorResult.next()) {
			actor = new Actor();
			actor.setId(actorResult.getInt("id"));
			actor.setFirstName(actorResult.getString("first_name"));
			actor.setLastName(actorResult.getString("last_name"));
		}

		actorResult.close();
		stmt.close();
		conn.close();

		return actor;

	}

	@Override
	public List<Actor> findActorsByFilmId(int filmId) {

		List<Actor> actors = new ArrayList<>();

		String user = "student";
		String pass = "student";

		try {
			Connection conn = DriverManager.getConnection(URL, user, pass);

			String sql = "SELECT * FROM actor JOIN film_actor ON actor.id = film_actor.actor_id WHERE film_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, filmId);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Actor actor = new Actor(rs.getInt("id"), rs.getString("first_name"), rs.getString("last_name"));
				actors.add(actor);
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return actors;

	}

	@Override
	public List<Film> findFilmByKeyword(String keyword) throws SQLException {
		Film film = new Film();
		List<Film> flist = new ArrayList<>();

		String user = "student";
		String pass = "student";

		Connection conn = DriverManager.getConnection(URL, user, pass);

		String sql = "SELECT film.id, film.title, film.release_year, film.rating,"
				+ "film.description , language.name FROM film JOIN language ON film.language_id = language.id "
				+ "WHERE film.title LIKE ? OR film.description LIKE ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, keyword);
		stmt.setString(2, keyword);
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			film = new Film(rs.getInt("id"), rs.getString("title"), rs.getString("description"),
					rs.getString("release_year"), rs.getString("rating"), rs.getString("language.name"));
			film.setActors(findActorsByFilmId(rs.getInt("film.id")));
			flist.add(film);
		}

		rs.close();
		stmt.close();
		conn.close();

		return flist;

	}

	@Override
	public Film createFilm(Film film) {

		String user = "student";
		String pass = "student";

		Connection conn = null;

		try {
			conn = DriverManager.getConnection(URL, user, pass);
			conn.setAutoCommit(false); // START TRANSACTION
			String sql = "INSERT INTO film (film.title,film.description, film.release_year, film.rating,"
					+ "film.language_id) " + " VALUES (?,?,?,?,1)";

			PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, film.getTitle());
			stmt.setString(2, film.getDescription());
			stmt.setString(3, film.getReleaseYear());
			stmt.setString(4, film.getRating());

			int updateCount = stmt.executeUpdate();
			System.out.println(updateCount + " film record created.");

			if (updateCount == 1) {
				ResultSet keys = stmt.getGeneratedKeys();
				while (keys.next()) {
					int filmId = keys.getInt(1);
					film.setId(filmId);
				}
				// If we made it this far, no exception occurred.
				conn.commit(); // Commit the transaction

			} else {
				film = null;
			}
			conn.commit(); // COMMIT TRANSACTION
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			throw new RuntimeException("Error inserting actor " + film);
		}
		return film;

	}

	@Override
	public boolean deleteFilm(Film film) {

		String user = "student";
		String pass = "student";

		Connection conn = null;

		try {
			conn = DriverManager.getConnection(URL, user, pass);

			conn.setAutoCommit(false); // START TRANSACTION

			String sql = "DELETE FROM film WHERE id = ?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, film.getId());

			int updateCount = stmt.executeUpdate();
			System.out.println(updateCount + " film was deleted");

			stmt = conn.prepareStatement(sql);

			conn.commit(); // COMMIT TRANSACTION
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			return false;
		}
		return true;
	}

	@Override
	public boolean updateFilm(Film film) {

		String user = "student";
		String pass = "student";

		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, user, pass);

			conn.setAutoCommit(false); // START TRANSACTION

			String sql = "UPDATE film SET title=?, description=?, release_year=?, rating=? " + " WHERE id=?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, film.getTitle());
			stmt.setString(2, film.getDescription());
			stmt.setString(3, film.getReleaseYear());
			stmt.setString(4, film.getRating());
			stmt.setInt(5, film.getId());

			int updateCount = stmt.executeUpdate();
			System.out.println(updateCount + " film was updated");
			conn.commit(); // COMMIT TRANSACTION

		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} // ROLLBACK TRANSACTION ON ERROR
				catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			return false;
		}
		return true;

	}

}
