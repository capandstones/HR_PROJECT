package attention.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import attention.beans.EmployeesBean;
import attention.service.EmployeesService;

@Controller
@RequestMapping("/member")
public class MemberContoller {

   @Autowired
   EmployeesService employeesService;
   
   private final Logger logger = LoggerFactory.getLogger(getClass());

   @GetMapping("/member")
   public String member(@ModelAttribute("employeesBean") EmployeesBean employeesBean) {
      return "member/member";

   }

   @GetMapping("/chart")
   public String chart(@ModelAttribute("employeesBean") EmployeesBean employeesBean) {
      System.out.println("[ MemberController >>> /chart ]");
      logger.info("[ MemberController >>> /chart ]");
      
      ArrayList<EmployeesBean> employeeList = employeesService.getEmpInfo();
      System.out.println("Get employeeList: " + employeeList.toString());
      logger.info("Get employeeList: {}", employeeList);
      
      return "member/chart";
   }

   @GetMapping("/member_info")
   public String memberInfo() {
      return "member/member_info";

   }
}