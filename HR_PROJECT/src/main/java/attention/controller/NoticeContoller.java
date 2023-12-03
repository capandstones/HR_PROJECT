package attention.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeContoller {
	
	@GetMapping("/all")
	public String all() {
		return "notice/all";
		
	}
	
	@GetMapping("/department")
	public String department() {
		return "notice/department";
		
	}
	
	@GetMapping("/write")
	public String write() {
		
		return "notice/write";
	}
	
	@GetMapping("/favorites")
	public String favorites() {
		return "notice/favorites";
		
	}


}
