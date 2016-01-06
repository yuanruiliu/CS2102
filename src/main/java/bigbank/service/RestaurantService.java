package bigbank.service;

import java.util.Calendar;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bigbank.bean.Restaurant;
import bigbank.dao.RestaurantDao;
import bigbank.utils.Constants;

@Service
public class RestaurantService {
	@Autowired 
	RestaurantDao restDao;

	public List<Restaurant> getTopRestaurants() {
		return restDao.getRestWithMostReviews(Constants.TOP_N);
	}

	public List<Restaurant> getRestaurantsByQuery(Map<String, String> query) {
		return restDao.getRestaurantsByQuery(query);
	}

	public List<Restaurant> getRestaurantsByOwnerId(int ownerId) {
		return restDao.getRestaurantsByOwnerId(ownerId);
	}

	public boolean approveRestaurantWithId(int restId) {
		Restaurant rest = restDao.getRestaurantById(restId);
		rest.setIsApproved(1);
		return restDao.updateRestaurantById(restId, rest);
	}

	public boolean removeRestaurantById(int restId) {
		return restDao.removeRestaurantById(restId);
	}

	public boolean updateRestaurant(Restaurant rest) {
		Restaurant old = restDao.getRestaurantById(rest.getId());
		if (rest.getName()!=null && !old.getName().equals(rest.getName())) {
			old.setName(rest.getName());
		}
		if (rest.getAddress()!=null && !old.getAddress().equals(rest.getAddress())) {
			old.setAddress(rest.getAddress());
		}
		if (rest.getCategory()!=null && !old.getCategory().equals(rest.getCategory())) {
			old.setCategory(rest.getCategory());
		}
		if (rest.getAvgPrice()!=0 && old.getAvgPrice() != rest.getAvgPrice()) {
			old.setAvgPrice(rest.getAvgPrice());
		}
		if (rest.getArea()!=null && old.getArea() != rest.getArea()) {
			old.setArea(rest.getArea());
		}
		return restDao.updateRestaurantById(rest.getId(), old);
	}

	public int createRestaurant(Restaurant newRest) {
		newRest.setCreateTime(Calendar.getInstance().getTime());
		return restDao.createRestaurant(newRest);
	}

	public Restaurant getRestaurantById(int restId) {
		return restDao.getRestaurantById(restId);
	}

	public List<Restaurant> getAllRestaurants() {
		return restDao.getAllRestaurants();
	}

	public List<Restaurant> getRestaurantsByCategory(String category) {
		return restDao.getRestaurantsByCategory(category);
	}

	public Object getUnApprovedRestaurants() {
		return restDao.getUnApprovedRestaurants();
	}
	
}
