package bigbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;

import bigbank.bean.User;
import bigbank.service.UserService;

@Controller
@RequestMapping(value = "/account")
public class AccountController {
	@Autowired
	UserService userService;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String createLoginForm(Model model) {
		Object principle = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principle instanceof String) {
			return "login";
		}
		return "main";
	}

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String createRegisterForm(Model model) {
		model.addAttribute("newuser", new User());
		return "register";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String newUserRegister(@ModelAttribute User user, Model model) {
		model.addAttribute("newuser", user);
		if (!user.getPassword().equals(user.getConfirmPassword())) {
			return "register";
		}
		if (userService.createUser(user)) {
			System.out.println("succeed");
			return "main";
		} else {
			System.out.println("failed");
			return "register";
		}
	}
}
