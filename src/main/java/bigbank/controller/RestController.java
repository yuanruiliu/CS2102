package bigbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bigbank.bean.Restaurant;
import bigbank.bean.Review;
import bigbank.bean.User;
import bigbank.service.EvaluateService;
import bigbank.service.RestaurantService;
import bigbank.service.UserService;

@Controller
@RequestMapping(value = "/store")
public class RestController {
	@Autowired
	RestaurantService restService;
	@Autowired
	EvaluateService evalService;
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/{restId}", method = RequestMethod.GET) 
	public String getPage(@PathVariable int restId, Model model) {
		Restaurant rest = restService.getRestaurantById(restId);
		List<Review> reviews = evalService.getCommentsByRest(restId);
		for (Review r : reviews) {
			r.setUserEmail(userService.getUserById(r.getUserId()).getEmail());
		}
		model.addAttribute("rest", rest);
		model.addAttribute("reviews", reviews);
		return "store";
	}
	
	@RequestMapping(value="review/{restId}", method = RequestMethod.POST)
	public @ResponseBody String addReview(@PathVariable int restId, @RequestParam("review") String review) {
		String email = ((org.springframework.security.core.userdetails.User) SecurityContextHolder
				.getContext().getAuthentication().getPrincipal()).getUsername();
		User user = userService.getUserByEmail(email);
		evalService.createEvaluation(restId, user.getId(), review);
		
		return "{\"name\":\""+email+"\",\"review\":\""+review+"\"}";
	}
}
