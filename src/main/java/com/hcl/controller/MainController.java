package com.hcl.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.dao.ProductRepository;
import com.hcl.dao.UserRepository;
import com.hcl.model.Login;
import com.hcl.model.Product;
import com.hcl.model.User;

@Controller
public class MainController {
	@Autowired
	private UserRepository userRepo;
	@Autowired
	private ProductRepository prodRepo;
	
	@GetMapping("/")
	public ModelAndView home() {
		return new ModelAndView("index");
	}
	
	@GetMapping("/register")
	public ModelAndView getRegister() {
		User newUser = new User();	
		return new ModelAndView("register", "form", newUser);
	}
	
	@PostMapping("/register")
	public String putRegister(User u) {
		userRepo.save(u);
		return("redirect:/");
	}
	
	@GetMapping("/login")
	public ModelAndView getLogin() {
		Login login = new Login();	
		return new ModelAndView("login", "form", login);
	}
	
	@PostMapping("/login")
	public String putLogin(Login l, HttpSession session) {
		User user = userRepo.findByUserEmail(l.getEmail());
		if (user != null) {
			session.setAttribute("user", user);
			return("redirect:/products");
		} else {
			return("redirect:/login");
		}
		
	}
	
	@GetMapping("/products")
	public ModelAndView getProducts() {
		List<Product> allProducts = (List<Product>) prodRepo.findAll();
		return new ModelAndView("products", "products", allProducts);
	}
}
