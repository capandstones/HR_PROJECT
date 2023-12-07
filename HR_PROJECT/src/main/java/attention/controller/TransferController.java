package attention.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import attention.beans.UserBean;
import attention.service.TransferService;

@Controller
@RequestMapping("/transfer")
public class TransferController {

	
	@Autowired
	private TransferService transferService;


	@GetMapping("/move")
	public String move(Model model) {
		
		
		List<UserBean> list = transferService.allemplist();
			
		model.addAttribute("list", list);
		
		return "transfer/move";
	}
	
	@GetMapping("/record")
	public String record() {
		return "transfer/record";
	}
	
	
	

}
