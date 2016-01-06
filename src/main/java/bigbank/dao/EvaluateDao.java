package bigbank.dao;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import bigbank.bean.Review;

@Repository
public class EvaluateDao extends BasicDao {

	public boolean createEvaluation(int restId, int userId, String comment) {
		Date date = Calendar.getInstance().getTime();
		StringBuilder sql = new StringBuilder();
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("time", date);

		sql.append("insert into time values (:time)");
		int rows = jdbcTemplate.update(sql.toString(), parameters);

		sql = new StringBuilder();
		sql.append("insert into evaluate values (").append(
				" :userId, :restId, :time, :comment)");

		parameters.put("userId", userId);
		parameters.put("restId", restId);
		parameters.put("comment", comment);

		rows = jdbcTemplate.update(sql.toString(), parameters);

		return rows > 1;
	}

	public List<Review> getCommentsByRest(int restId) {
		StringBuilder sql = new StringBuilder();
		Map<String, Object> parameters = new HashMap<String, Object>();
		sql.append("select * from evaluate").append(
				" where restaurant_id=:restId");
		parameters.put("restId", restId);

		List<Review> resultList = jdbcTemplate.query(sql.toString(),
				parameters, new BeanPropertyRowMapper<Review>(Review.class));

		return resultList;
	}

}
