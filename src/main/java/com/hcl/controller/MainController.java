package com.hcl.controller;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@ComponentScan
public class MainController {

	@GetMapping("/")
	public ModelAndView home() {
		return new ModelAndView("index");
	}
}
