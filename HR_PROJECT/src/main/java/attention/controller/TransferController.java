package attention.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import attention.beans.UserBean;
import attention.mapper.TransferMapper;
import attention.service.TransferService;

@Controller
@RequestMapping("/transfer")
public class TransferController {

	
	@Autowired
	private TransferService transferService;
	
	@Autowired
	private TransferMapper transferMapper;
	


	@GetMapping("/move")
	public String move(Model model) {
		
		
		List<UserBean> list = transferService.allemplist();
			
		model.addAttribute("list", list);
		
		return "transfer/move";
	}
	
	@GetMapping("/record")
	public String record(Model model) {
		
		List<UserBean> list = transferMapper.allHistory();
		
		model.addAttribute("list", list);
		
		return "transfer/record";
	}
	

	@GetMapping("/move_pro")
	public String move_pro(@RequestParam("employee_id") String employee_id,
						   @RequestParam("department_name") String department_name,
						   @RequestParam("line_name") String line_name,  
						   @RequestParam("employee_position") String employee_position,  
						   Model model) {
		
		transferMapper.movingInfo(employee_id,department_name,line_name,employee_position);

		
		List<UserBean> list = transferService.allemplist();
		
		model.addAttribute("list", list);
		
		return "transfer/move";
	}
	

}
