package kr.co.soldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/commute")
public class CommuteContoller {
	
	@GetMapping("/main")
	public String main() {
		return "commute/main";
		
	}

}
