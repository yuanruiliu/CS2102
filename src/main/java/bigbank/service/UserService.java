package bigbank.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bigbank.bean.User;
import bigbank.dao.UserDao;

@Service
public class UserService {
	@Autowired
	UserDao userDao;
	
	public boolean isMember(User user) {
		String email = user.getEmail();
		User member = userDao.getUserByEmail(email);
		
		if (member == null) {
			return false;
		} else if (!member.getPassword().equals(user.getPassword())) {
			return false;
		}
			
		return true;
	}

	public boolean createUser(User user) {
		return userDao.createUser(user);
	}

	public User getUserByEmail(String email) {
		return userDao.getUserByEmail(email);
	}

	public User getUserById(int userId) {
		return userDao.getUserById(userId);
	}
}
