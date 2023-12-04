package attention.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import attention.service.VacationService;

@Controller
@RequestMapping("/vacation")
@CrossOrigin(origins = "http://yourfrontenddomain.com")
public class VacationController {
   
   @Autowired
    private VacationService vacationService;

   @GetMapping("/main")
   public String main() {
      return "vacation/main";
   }

   @GetMapping("/request1")
   public String request1(HttpServletRequest request) {
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

   @PostMapping("/submit_pro")
   public String submit_pro(
         @RequestParam("vacation_name") String vacation_name,
           @RequestParam("employee_name") String employee_name,
           @RequestParam("employee_id_ch") String employee_id_ch,
           @RequestParam("employee_id_ch2") String employee_id_ch2,
           @RequestParam("vacation_start_date") String vacation_start_date,
           @RequestParam("vacation_end_date") String vacation_end_date,
           @RequestParam("vacation_days") int vacation_days,
           @RequestParam("vacation_reason") String vacation_reason) {

       vacationService.saveVacation(vacation_name, employee_name, employee_id_ch, employee_id_ch2, vacation_start_date,
             vacation_end_date, vacation_days, vacation_reason);

       return "vacation/success";
   }
}