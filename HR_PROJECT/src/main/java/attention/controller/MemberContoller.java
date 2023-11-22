package attention.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberContoller {
   
   @GetMapping("/member")
   public String member() {
      return "member/member";
      
   }
   
   @GetMapping("/chart")
   public String chart() {
      return "member/chart";
      
   }

   @GetMapping("/member_info")
   public String memberInfo() {
      return "member/member_info";
      
   }
}