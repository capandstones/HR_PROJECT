package attention.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import attention.beans.EmployeesBean;

@Controller
@RequestMapping("/member")
public class MemberContoller {
   
   @GetMapping("/member")
   public String member(@ModelAttribute("employeesBean") EmployeesBean employeesBean) {
      return "member/member";
      
   }
   
   @GetMapping("/chart")
   public String chart(@ModelAttribute("employeesBean") EmployeesBean employeesBean) {
      return "member/chart";
      
   }
   
   @GetMapping("/member_info")
   public String memberInfo() {
      return "member/member_info";
      
   }
}