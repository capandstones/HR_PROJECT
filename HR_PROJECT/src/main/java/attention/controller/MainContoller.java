package attention.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import attention.beans.EmployeesBean;
import attention.beans.UserBean;
import attention.mapper.EmployeesMapper;

@Controller
@RequestMapping("/main")
public class MainContoller {

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@Autowired
	EmployeesMapper employeesMapper;

	@GetMapping("/main")
	public String main(String employee_id, Model model) {
		
		String empId = loginUserBean.getEmployee_id();
		
		EmployeesBean employeeInfo = employeesMapper.getEmpInfoDetail(empId);
		model.addAttribute(employeeInfo);
		
		return"main/main";
	}
	
}

