package com.hcl.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.dao.OrderRepository;
import com.hcl.dao.ProductRepository;
import com.hcl.dao.UserRepository;
import com.hcl.model.Login;
import com.hcl.model.Order;
import com.hcl.model.Product;
import com.hcl.model.User;

@Controller
public class MainController {
	@Autowired
	private UserRepository userRepo;
	@Autowired
	private ProductRepository prodRepo;
	@Autowired
	private OrderRepository orderRepo;

	@GetMapping("/")
	public ModelAndView home(HttpSession session) {
		return new ModelAndView("index", "user", (User) session.getAttribute("user"));
	}

	@GetMapping("/register")
	public ModelAndView getRegister() {
		User newUser = new User();
		return new ModelAndView("register", "form", newUser);
	}

	@PostMapping("/register")
	public String putRegister(User u, HttpSession session) {
		userRepo.save(u);
		session.setAttribute("user", u);
		return ("redirect:/");
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
			return ("redirect:/products");
		} else {
			return ("redirect:/login");
		}

	}

	@GetMapping("/products")
	public ModelAndView getProducts(HttpSession session) {
		List<Product> allProducts = (List<Product>) prodRepo.findAll();
		ModelAndView mv = new ModelAndView("products", "products", allProducts);
		User user = (User) session.getAttribute("user");
		mv.addObject("user", user);
		return mv;
	}

	@GetMapping("/cart")
	public ModelAndView getCart(HttpSession session) {
		List<Product> cartList = (List<Product>) session.getAttribute("cart");
		if (cartList == null) {
			cartList = new ArrayList<Product>();
			session.setAttribute("cart", cartList);
		}
		User user = (User) session.getAttribute("user");
		ModelAndView mv = new ModelAndView("cart", "cart", cartList);
		mv.addObject("user", user);
		return mv;
	}

	@GetMapping("/addcart/{id}")
	public ModelAndView getAddCart(@PathVariable long id, HttpSession session) {
		Product prodToAdd = prodRepo.findById(id).get();
		List<Product> cartList = (List<Product>) session.getAttribute("cart");
		if (cartList == null) {
			cartList = new ArrayList<Product>();
		}
		cartList.add(prodToAdd);
		session.setAttribute("cart", cartList);
		return new ModelAndView("redirect:/cart");
	}

	@GetMapping("/removecart/{id}")
	public ModelAndView getRemoveCart(@PathVariable long id, HttpSession session) {
		Product prodToRemove = prodRepo.findById(id).get();
		List<Product> cartList = (List<Product>) session.getAttribute("cart");
		cartList.remove(prodToRemove);
		session.setAttribute("cart", cartList);
		return new ModelAndView("redirect:/cart");
	}

	@GetMapping("/checkout")
	public ModelAndView getCheckout(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return new ModelAndView("redirect:/login");
		}
		List<Product> cartList = (List<Product>) session.getAttribute("cart");
		if (cartList == null) {
			return new ModelAndView("redirect:/products");
		}
		ModelAndView mv = new ModelAndView("checkout", "cart", cartList);
		mv.addObject("user", user);
		double total = cartList.stream().mapToDouble(p -> p.getProdPrice()).sum();
		mv.addObject("total", total);
		return mv;
	}

	@GetMapping("/profile")
	public ModelAndView getProfile(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return new ModelAndView("redirect:/login");
		}
		User newUser = new User();
		ModelAndView mv = new ModelAndView("profile", "form", newUser);
		mv.addObject("user", user);
		return mv;
	}

	@PostMapping("/profile")
	public ModelAndView postProfile(User u, HttpSession session) {
		User test = (User) session.getAttribute("user");
		if (test == null) {
			return new ModelAndView("redirect:/login");
		}
		session.setAttribute("user", u);
		userRepo.save(u);
		return new ModelAndView("redirect:/products");
	}

	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:/");
	}

	@GetMapping("/details/{id}")
	public ModelAndView getDetails(@PathVariable long id, HttpSession session) {
		Product prodToSee = prodRepo.findById(id).get();
		ModelAndView mv = new ModelAndView("details", "product", prodToSee);
		mv.addObject("user", (User) session.getAttribute("user"));
		return mv;
	}

	@GetMapping("/confirm")
	public ModelAndView getConfirm(HttpSession session) {
		List<Product> cartList = (List<Product>) session.getAttribute("cart");
		String cartOutput = cartList.stream().map(Object::toString).collect(Collectors.joining(", "));
		System.out.println("debug: " + cartOutput);
		Order newOrder = new Order();
		newOrder.setUser((User) session.getAttribute("user"));
		newOrder.setCartSerial(cartOutput);
		orderRepo.save(newOrder);
		List<Product> newCart = new ArrayList<Product>();
		session.setAttribute("cart", newCart);
		ModelAndView mv = new ModelAndView("confirm", "orderNo", newOrder.getId());
		return mv;
	}

	@GetMapping("/search")
	public ModelAndView getSearch(@RequestParam String term, HttpSession session) {
		List<Product> allProducts = (List<Product>) prodRepo.search(term);
		ModelAndView mv = new ModelAndView("products", "products", allProducts);
		User user = (User) session.getAttribute("user");
		mv.addObject("user", user);
		return mv;
	}

	@GetMapping("/admin")
	public ModelAndView getAdmin(HttpSession session) {
		// Verify Admin in Backend
		User sessionUser = (User) session.getAttribute("user");
		if (sessionUser == null) {
			return new ModelAndView("redirect:/");
		}
		User lookupUser = userRepo.findById(sessionUser.getId()).get();
		if (lookupUser.isAdmin() == false) {
			return new ModelAndView("redirect:/");
		}
		// --------------
		List<Product> allProducts = (List<Product>) prodRepo.findAll();
		ModelAndView mv = new ModelAndView("admin", "products", allProducts);
		List<User> allUsers = (List<User>) userRepo.findAll();
		mv.addObject("users", allUsers);
		return mv;
	}

	@GetMapping("/admin/edituser/{id}")
	public ModelAndView getEditUser(@PathVariable long id, HttpSession session) {
		// Verify Admin in Backend
		User sessionUser = (User) session.getAttribute("user");
		if (sessionUser == null) {
			return new ModelAndView("redirect:/");
		}
		User lookupUser = userRepo.findById(sessionUser.getId()).get();
		if (lookupUser.isAdmin() == false) {
			return new ModelAndView("redirect:/");
		}
		// --------------
		User userToEdit = userRepo.findById(id).get();
		ModelAndView mv = new ModelAndView("edituser", "form", userToEdit);
		return mv;
	}

	@PostMapping("/admin/edituser/{id}")
	public ModelAndView postEditUser(User u, @PathVariable long id, HttpSession session) {
		// Verify Admin in Backend
		User sessionUser = (User) session.getAttribute("user");
		if (sessionUser == null) {
			return new ModelAndView("redirect:/");
		}
		User lookupUser = userRepo.findById(sessionUser.getId()).get();
		if (lookupUser.isAdmin() == false) {
			return new ModelAndView("redirect:/");
		}
		// --------------
		userRepo.save(u);
		return new ModelAndView("redirect:/admin");
	}
	
	@GetMapping("/admin/deluser/{id}")
	public ModelAndView getDelUser(@PathVariable long id, HttpSession session) {
		// Verify Admin in Backend
		User sessionUser = (User) session.getAttribute("user");
		if (sessionUser == null) {
			return new ModelAndView("redirect:/");
		}
		User lookupUser = userRepo.findById(sessionUser.getId()).get();
		if (lookupUser.isAdmin() == false) {
			return new ModelAndView("redirect:/");
		}
		// --------------
		User userToDel = userRepo.findById(id).get();
		userRepo.delete(userToDel);
		return new ModelAndView("redirect:/admin");
	}

	@GetMapping("/admin/editprod/{id}")
	public ModelAndView getEditProd(@PathVariable long id, HttpSession session) {
		// Verify Admin in Backend
		User sessionUser = (User) session.getAttribute("user");
		if (sessionUser == null) {
			return new ModelAndView("redirect:/");
		}
		User lookupUser = userRepo.findById(sessionUser.getId()).get();
		if (lookupUser.isAdmin() == false) {
			return new ModelAndView("redirect:/");
		}
		// --------------
		Product prodToEdit = prodRepo.findById(id).get();
		return new ModelAndView("editprod", "form", prodToEdit);

	}

	@PostMapping("/admin/editprod/{id}")
	public ModelAndView postEditProd(Product p, @PathVariable long id, HttpSession session) {
		// Verify Admin in Backend
		User sessionUser = (User) session.getAttribute("user");
		if (sessionUser == null) {
			return new ModelAndView("redirect:/");
		}
		User lookupUser = userRepo.findById(sessionUser.getId()).get();
		if (lookupUser.isAdmin() == false) {
			return new ModelAndView("redirect:/");
		}
		// --------------
		prodRepo.save(p);
		return new ModelAndView("redirect:/admin");
	}
	
	@GetMapping("/admin/delprod/{id}")
	public ModelAndView getDelProd(@PathVariable long id, HttpSession session) {
		// Verify Admin in Backend
		User sessionUser = (User) session.getAttribute("user");
		if (sessionUser == null) {
			return new ModelAndView("redirect:/");
		}
		User lookupUser = userRepo.findById(sessionUser.getId()).get();
		if (lookupUser.isAdmin() == false) {
			return new ModelAndView("redirect:/");
		}
		// --------------
		Product prodToDel = prodRepo.findById(id).get();
		prodRepo.delete(prodToDel);
		return new ModelAndView("redirect:/admin");

	}
}
