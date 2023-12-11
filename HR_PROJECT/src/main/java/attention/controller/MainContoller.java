package attention.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import attention.beans.EmployeesBean;
import attention.beans.UserBean;

@Controller
@RequestMapping("/main")
public class MainContoller {
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	@GetMapping("/main")
	public String main() {
		String empId = loginUserBean.getEmployee_id();
		
		public List<EmployeesBean> getEmpId(empId) {
			return 
		}
		
		return "main/main";
	}

}
