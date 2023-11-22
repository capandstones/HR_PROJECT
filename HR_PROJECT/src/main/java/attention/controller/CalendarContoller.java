package attention.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/calendar")
public class CalendarContoller {
	
	@GetMapping("/main")
	public String main() {
		return "calendar/main";
		
	}

}
