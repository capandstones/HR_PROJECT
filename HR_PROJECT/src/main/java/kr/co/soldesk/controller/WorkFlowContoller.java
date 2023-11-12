package kr.co.soldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/workflow")
public class WorkFlowContoller {
	
	@GetMapping("/main")
	public String main() {
		return "workflow/main";
		
	}

}
