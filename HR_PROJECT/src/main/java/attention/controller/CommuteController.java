package attention.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/commute")
public class CommuteController {
   
   @GetMapping("/main")
   public String main() {
      return "commute/main";
      
   }

}