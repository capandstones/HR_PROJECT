package kr.co.soldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberContoller {
	
	@GetMapping("/member")
	public String member() {
		return "member/member";
		
	}
	
	@GetMapping("/chart")
	public String chart() {
		return "member/chart";
		
	}

}
