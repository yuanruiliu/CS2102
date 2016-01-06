package bigbank.controller;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bigbank.bean.Restaurant;
import bigbank.service.RestaurantService;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	@Autowired
	RestaurantService restService;
	
	@RequestMapping(value = "/hotshops", method = RequestMethod.GET)
	public @ResponseBody List<Restaurant> getHotShops() {
		return restService.getTopRestaurants();
	}
	
	@RequestMapping(value = "/stats", method = RequestMethod.GET)
	public String getStatPage() {
		return "stat";
	}
	
	@RequestMapping(value = "/about", method= RequestMethod.GET)
	public String getAboutPage() {
		return "about";
	}

	@RequestMapping(value = "/category", method = RequestMethod.GET)
	public String getCategoryPage(Model model) {
		model.addAttribute("page_title", "Category List");
		return "category";
	}
}
