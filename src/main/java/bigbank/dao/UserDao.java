package bigbank.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import bigbank.bean.User;

@Repository
public class UserDao extends BasicDao {
	public UserDao() {
		super();
	}

	public User getUserByEmail(String email) {
		StringBuilder sql = new StringBuilder();
		Map<String, Object> parameters = new HashMap<String, Object>();
		sql.append("select * from user where email=:email");
		parameters.put("email", email);

		List<User> resultList = jdbcTemplate.query(sql.toString(), parameters,
				new BeanPropertyRowMapper<User>(User.class));
		User user = null;
		if (resultList != null && resultList.size() > 0) {
			user = resultList.get(0);
		}
		return user;
	}

	public boolean createUser(User user) {
		StringBuilder sql = new StringBuilder();
		Map<String, Object> parameters = new HashMap<String, Object>();
		sql.append("INSERT INTO `user`(`email`, `name`, `password`, `authority`) " +
				"VALUES (:email,:name,:password,:authority)");
		parameters.put("email", user.getEmail());
		parameters.put("name", user.getName());
		parameters.put("password", user.getPassword());
		parameters.put("authority","member");
		
		int row = jdbcTemplate.update(sql.toString(), parameters);
		return (row == 1);
	}

	public User getUserById(int userId) {
		StringBuilder sql = new StringBuilder();
		Map<String, Object> parameters = new HashMap<String, Object>();
		sql.append("select * from user where id=:id");
		parameters.put("id", userId);

		List<User> resultList = jdbcTemplate.query(sql.toString(), parameters,
				new BeanPropertyRowMapper<User>(User.class));
		User user = null;
		if (resultList != null && resultList.size() > 0) {
			user = resultList.get(0);
		}
		return user;
	}
}
