package attention.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
		System.out.println("getEmpInfo »£√‚µ ");
		
		return employeesMapper.getEmpInfo();
	}
	
	@PostMapping("/getEmpInfoDetail/{employeeInfoKey}")
	EmployeesBean getEmpInfoDetail(@PathVariable String employeeInfoKey) {
		System.out.println("employeeInfoKey: " + employeeInfoKey);
		
		return employeesMapper.getEmpInfoDetail(employeeInfoKey);
	}
}
