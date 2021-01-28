package com.hcl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.dao.ProductRepository;
import com.hcl.dao.UserRepository;
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
	
	@GetMapping("/products")
	public ModelAndView getProducts() {
		List<Product> allProducts = (List<Product>) prodRepo.findAll();
		return new ModelAndView("products", "products", allProducts);
	}
}
