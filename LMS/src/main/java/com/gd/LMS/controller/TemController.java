package com.gd.LMS.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TemController {
	
	@GetMapping("/temForm")
	public String temForm() {
		
		return "temForm";
	}
}
