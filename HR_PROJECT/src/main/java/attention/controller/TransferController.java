package attention.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/transfer")
public class TransferController {



	@GetMapping("/move")
	public String move() {
		return "transfer/move";
	}
	
	@GetMapping("/record")
	public String record() {
		return "transfer/record";
	}
	
	
	

}
