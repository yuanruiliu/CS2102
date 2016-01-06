package bigbank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import bigbank.bean.Restaurant;
import bigbank.service.RestaurantService;

@Controller
@RequestMapping(value = "/search")
public class SearchController {
	@Autowired
	RestaurantService restService;

	@RequestMapping(method = RequestMethod.POST)
	public String search(@RequestBody MultiValueMap<String, String> params,
			Model model) {
		Map<String, String> query = new HashMap<String, String>();
		for (String key : params.keySet()) {
			if (params.get(key) == null) {
				query.put(key, null);
			} else {
				query.put(key, params.get(key).toString().replace("[", "")
						.replace("]", "").replace("'", "").trim());
			}
		}
		Gson gson = new Gson();
		List<Restaurant> result = restService.getRestaurantsByQuery(query);
		model.addAttribute("page_title", "Results");
		model.addAttribute("results", gson.toJson(result));
		return "category";
	}

	@RequestMapping(value = "/{category}", method = RequestMethod.GET)
	public @ResponseBody
	List<Restaurant> getRestaurantByCategory(@PathVariable String category) {
		List<Restaurant> results;
		if (category.equals("all")) {
			results = restService.getAllRestaurants();
		} else {
			results = restService.getRestaurantsByCategory(category);
		}
		return results;
	}

}
