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
import com.skilldistillery.film.entities.Category;
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

		String sql = "SELECT film.id, film.title, film.release_year, film.rating ,film.rental_duration,"
				+ "film.rental_rate,film.length,film.replacement_cost,film.rating,film.special_features,"
				+ "film.description, language.name FROM film JOIN language ON film.language_id = language.id WHERE film.id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, filmId);
		ResultSet filmResult = stmt.executeQuery();
		if (filmResult.next()) {

			film = (new Film(filmResult.getInt("film.id"), filmResult.getString("film.title"),
					filmResult.getString("film.description"), filmResult.getString("film.release_year"),
					filmResult.getInt("film.rental_duration"), filmResult.getDouble("film.rental_rate"),
					filmResult.getInt("film.length"), filmResult.getDouble("film.replacement_cost"),
					filmResult.getString("film.rating"), filmResult.getString("film.special_features"),
					filmResult.getNString("language.name")));

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
	public Film createFilm(Film film) {
		String user = "student";
		String pass = "student";
		String sqlInsert = "INSERT INTO film " + "(title, description, release_year, language_id, rental_duration, "
				+ "rental_rate, length, replacement_cost, rating, special_features) " + "VALUES (?,?,?,?,?,?,?,?,?,?)";
		try (Connection conn = DriverManager.getConnection(URL, user, pass);) {

			conn.setAutoCommit(false);

			try (PreparedStatement stmt = conn.prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS);) {

				stmt.setString(1, film.getTitle());
				stmt.setString(2, film.getDescription());
				stmt.setString(3, film.getReleaseYear());
				stmt.setInt(4, 1);
				stmt.setInt(5, film.getRentalDuration());
				stmt.setDouble(6, film.getRentalRate());
				stmt.setInt(7, film.getLength());
				stmt.setDouble(8, film.getReplacementCost());
				stmt.setString(9, film.getRating());
				stmt.setString(10, film.getSpecialFeatures());

				int updateCount = stmt.executeUpdate();
				if (updateCount == 1) {

					ResultSet keys = stmt.getGeneratedKeys();
					if (keys.next()) {
						// set New Film's ID
						film.setId(keys.getInt(1));
					}

				} else {
					film = null;
				}

				conn.commit();

			} catch (SQLException e) {
				e.printStackTrace();
				if (conn != null) {
					try {
						conn.rollback();
					} catch (SQLException sqle2) {
						System.err.println("Error trying to rollback");
					}
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
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

		boolean filmSaved = false;
		String sqlDelete = "UPDATE film "
				+ "SET title = ?, description = ?, release_year = ?, language_id = ?, rental_duration = ?, "
				+ "rental_rate = ?, length = ?, replacement_cost = ?, rating = ?, special_features = ? "
				+ "WHERE id = ?";

		try (Connection conn = DriverManager.getConnection(URL, user, pass);) {

			conn.setAutoCommit(false);

			try (PreparedStatement stmt = conn.prepareStatement(sqlDelete);) {

				stmt.setString(1, film.getTitle());
				stmt.setString(2, film.getDescription());
				stmt.setString(3, film.getReleaseYear());
				stmt.setInt(4, film.getLanguageId());
				stmt.setInt(5, film.getRentalDuration());
				stmt.setDouble(6, film.getRentalRate());
				stmt.setInt(7, film.getLength());
				stmt.setDouble(8, film.getReplacementCost());
				stmt.setString(9, film.getRating());
				stmt.setString(10, film.getSpecialFeatures());
				stmt.setInt(11, film.getId());

				int updateCount = stmt.executeUpdate();
				if (updateCount == 1) {
					filmSaved = true;

				} else {
					filmSaved = false;
				}

				conn.commit();

			} catch (SQLException e) {
				e.printStackTrace();
				if (conn != null) {
					try {
						conn.rollback();
					} catch (SQLException sqle2) {
						System.err.println("Error trying to rollback");
					}
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return filmSaved;
	}

	@Override
	public List<Film> findFilmByKeyword(String searchText) {

		List<Film> filmResults = new ArrayList<>();

		String user = "student";
		String pass = "student";

		String[] keyWords = searchText.split(" ");

		String sqlQuery = "SELECT * FROM film " + "JOIN language ON film.language_id = language.id "
				+ "JOIN film_category ON film.id = film_category.film_id "
				+ "JOIN category ON film_category.category_id = category.id "
				+ "WHERE title LIKE ? OR description LIKE ? ";
		if (keyWords.length > 1) {
			for (int i = 0; i < (keyWords.length - 1); i++) {
				sqlQuery += "OR title LIKE ? OR description LIKE ?";
			}
		}
		try (Connection conn = DriverManager.getConnection(URL, user, pass);
				PreparedStatement stmt = conn.prepareStatement(sqlQuery);) {
			int bindPosition = 1;
			for (String searchWord : keyWords) {
				stmt.setString(bindPosition, ("%" + searchWord + "%"));
				bindPosition++;
				stmt.setString(bindPosition, ("%" + searchWord + "%"));
				bindPosition++;
			}
//			To Check Compiled Statement
//			System.out.println(stmt);
			try (ResultSet fR = stmt.executeQuery();) {
				while (fR.next()) {
					Film film = new Film(fR.getInt("id"), fR.getString("title"), fR.getString("description"),
							fR.getString("release_year"), fR.getString("rating"), fR.getString("language.name"));
					film.setActors(findActorsByFilmId(fR.getInt("film.id")));
					filmResults.add(film);
				}
			}
		} catch (SQLException e) {
			System.err.println(e);
		}
		return filmResults;
	}

	@Override
	public Category findCategoriesByFilmId(int filmId) {

		Category category = null;

		String user = "student";
		String pass = "student";

		try {
			Connection conn = DriverManager.getConnection(URL, user, pass);

			String sql = "SELECT film.id, category.name , category.id FROM film JOIN film_category ON film.id = film_category.film_id\n"
					+ "JOIN category ON film_category.category_id = category.id WHERE film_id = ?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, filmId);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				category = (new Category(rs.getInt("id"), rs.getString("category.name")));
			}

			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return category;

	}

}
