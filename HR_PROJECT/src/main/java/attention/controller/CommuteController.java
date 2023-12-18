package attention.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import attention.beans.CommuteBean;
import attention.service.CommuteService;

@Controller
@RequestMapping("/commute")
public class CommuteController {

   @Autowired
   private CommuteService commuteService;
   
   @GetMapping("/main")
   public String main() {
      return "commute/main";
   }
   
   @GetMapping("/getCommuteTotal")
   @ResponseBody
   public List<CommuteBean> getCommuteTotal(@RequestParam("employee_id") String employee_id, @RequestParam("today") String today) {
      return commuteService.getCommuteTotal(employee_id, today);
   }
   
}