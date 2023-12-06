package attention.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import attention.beans.UserBean;
import attention.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	// service 주입;
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UserBean addEmployeeBean;
	
	@GetMapping("/main")
	public String main() {


		return "admin/main";
	}
	

	@GetMapping("/admin_join")
	public String admin_join(Model model) {

		adminService.getJoinList(addEmployeeBean);
		List<UserBean> list = adminService.getJoinList(addEmployeeBean);
		model.addAttribute("list", list);

		return "admin/admin_join";
	}
	
	
	@GetMapping("/admin_join_fail")
	public String admin_join_fail(@RequestParam("employee_id") String employee_id,
			Model model) {

		adminService.deleteJoin(employee_id);

		return "admin/admin_join_fail_msg";
	}
	
	@GetMapping("/admin_join_success")
	public String admin_join_success(@RequestParam("employee_id") String employee_id,
			Model model) {

		adminService.JoinAccept(employee_id);

		return "admin/admin_join_success_msg";
	}
	

}
