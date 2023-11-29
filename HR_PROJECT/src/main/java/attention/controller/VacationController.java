package attention.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/vacation")
public class VacationController {

   @GetMapping("/main")
   public String main() {
      return "vacation/main";
   }

   @GetMapping("/request1")
   public String request1() {
      return "vacation/request1";
   }

   @GetMapping("/request2")
   public String request2() {
      return "vacation/request2";
   }

   @GetMapping("/request3")
   public String request3() {
      return "vacation/request3";
   }

   @GetMapping("/request4")
   public String request4() {
      return "vacation/request4";
   }

   @GetMapping("/request5")
   public String request5() {
      return "vacation/request5";
   }

   @GetMapping("/request6")
   public String request6() {
      return "vacation/request6";
   }

   @GetMapping("/request7")
   public String request7() {
      return "vacation/request7";
   }

   @GetMapping("/request8")
   public String request8() {
      return "vacation/request8";
   }

}