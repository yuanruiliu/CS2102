package bigbank.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import bigbank.bean.Restaurant;
import bigbank.bean.User;
import bigbank.service.RestaurantService;
import bigbank.service.UserService;

@Controller
@RequestMapping(value = "/manage")
public class ManageController {
	@Autowired
	RestaurantService restService;
	@Autowired
	UserService userService;
	private static final String CACHE_PATH = "./src/main/webapp/misc/image/temp/";
	private static final String IMAGE_PATH = "./src/main/webapp/misc/image/restaurant/";
	private static final String CACHE_NAME = "temp.jpeg";
	private String filePath;

	@RequestMapping(method = RequestMethod.GET)
	public String getMemberManagePage(Model model) {

		User user = getCurrentUser();

		if (user.getAuthority().equals("admin")) {
			model.addAttribute("restList",
					restService.getUnApprovedRestaurants());
		} else {
			model.addAttribute("restList",
					restService.getRestaurantsByOwnerId(user.getId()));
		}
		return "manage";
	}

	private User getCurrentUser() {
		String email = ((org.springframework.security.core.userdetails.User) SecurityContextHolder
				.getContext().getAuthentication().getPrincipal()).getUsername();
		User user = userService.getUserByEmail(email);
		return user;
	}

	@RequestMapping(value = "/approve/{restId}")
	public @ResponseBody
	boolean approveRestaurantById(@PathVariable int restId) {
		return restService.approveRestaurantWithId(restId);
	}

	@RequestMapping(value = "/delete/{restId}")
	public @ResponseBody
	boolean deleteRestaurantById(@PathVariable int restId) {
		File photo = new File(IMAGE_PATH + restId + ".jpeg");
		if (photo.exists()) {
			photo.delete();
		}
		return restService.removeRestaurantById(restId);
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public @ResponseBody
	String newRestModel(@RequestParam("value") String value,
			@RequestParam("id") String field) {
		String[] args = field.split(" ");
		String attr = args[0];
		int id = Integer.parseInt(args[1]);
		Restaurant rest = new Restaurant();
		rest.setId(id);
		switch (attr) {
		case "name":
			rest.setName(value);
			break;
		case "address":
			rest.setAddress(value);
			break;
		case "category":
			rest.setCategory(value);
			break;
		case "avgPrice":
			rest.setAvgPrice(Integer.parseInt(value));
			break;
		case "area":
			rest.setArea(value);
			break;
		default:
			break;
		}
		restService.updateRestaurant(rest);
		return value;
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String getNewRestaurantForm(Model model) {
		model.addAttribute("newRestaurant", new Restaurant());
		return "addnew";
	}

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public String createNewRestaurant(@ModelAttribute Restaurant newRest,
			Model model) {
		User user = getCurrentUser();
		String authority = user.getAuthority();
		if (authority.equals("admin")) {
			newRest.setIsApproved(1);
		} else {
			newRest.setIsApproved(0);
		}
		int usreId = user.getId();
		newRest.setOwner(usreId);
		int restId = restService.createRestaurant(newRest);
		if (restId != -1) {
			saveTempImageWithId(restId);
		}
		if (authority.equals("admin")) {
			model.addAttribute("restList", restService.getUnApprovedRestaurants());
		} else {
			model.addAttribute("restList",
					restService.getRestaurantsByOwnerId(user.getId()));
		}
		return "manage";
	}

	private void saveTempImageWithId(int restId) {
		File tempImage = new File(filePath);
		File image = new File(IMAGE_PATH + restId + ".jpeg");
		tempImage.renameTo(image);
	}

	@RequestMapping(value = "/tempimage", method = RequestMethod.POST)
	public void cacheImage(@RequestParam("file") MultipartFile file) {
		try {
			if (file.getSize() > 0) {
				filePath = CACHE_PATH + CACHE_NAME;
				File fout = new File(filePath);
				if (fout.exists()) {
					fout.delete();
				}
				fout.createNewFile();
				InputStream inputStream = file.getInputStream();
				OutputStream outputStream = new FileOutputStream(filePath);
				int readBytes = 0;
				byte[] buffer = new byte[1024];
				while ((readBytes = inputStream.read(buffer, 0, 1024)) != -1) {
					outputStream.write(buffer, 0, readBytes);
				}
				outputStream.close();
				inputStream.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
