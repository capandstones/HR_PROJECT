package attention.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import attention.beans.EmployeesBean;
import attention.service.EmployeesService;

@RestController
public class RestApiController {
	
	@Autowired
	private EmployeesService employeesService;
	
	@GetMapping("/member/getEmpInfo/{employee_id}")
	public ArrayList<EmployeesBean> getEmpInfo (@PathVariable String employee_id){
		return employeesService.getEmpInfo(employee_id);
	}
	
}
