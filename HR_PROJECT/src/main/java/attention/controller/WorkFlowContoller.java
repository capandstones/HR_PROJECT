package attention.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/workflow")
public class WorkFlowContoller {
	
	@GetMapping("/write")
	public String write() {
		return "workflow/write";
		
	}
	
	@GetMapping("/document")
	public String document() {
		return "workflow/document";
		
	}

}
