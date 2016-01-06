package bigbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bigbank.bean.Review;
import bigbank.dao.EvaluateDao;

@Service
public class EvaluateService {
	@Autowired
	EvaluateDao evalDao;
	
	public boolean createEvaluation(int restId, int userId, String comment) {
		return evalDao.createEvaluation(restId, userId, comment);
	}

	public List<Review> getCommentsByRest(int restId) {
		return evalDao.getCommentsByRest(restId);
	}
}
