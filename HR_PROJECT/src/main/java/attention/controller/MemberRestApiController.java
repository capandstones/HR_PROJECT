package attention.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import attention.beans.EmployeesBean;
import attention.mapper.EmployeesMapper;

@RestController
public class MemberRestApiController {
	
	@Autowired
	private EmployeesMapper employeesMapper;

	@GetMapping("/getEmpInfo")
	public @ResponseBody ArrayList<EmployeesBean> getEmpInfo() {		
		return employeesMapper.getEmpInfo();
	}
	
	@PostMapping("/getEmpInfoDetail")
	EmployeesBean getEmpInfoDetail(@RequestBody String employeeInfoKey) {
		System.out.println("[ /HR_Project/getEmpInfoDetail ]");
		System.out.println("employeeInfoKey: " + employeeInfoKey);
		
		return employeesMapper.getEmpInfoDetail(employeeInfoKey);
	}
}