package attention.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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

}
