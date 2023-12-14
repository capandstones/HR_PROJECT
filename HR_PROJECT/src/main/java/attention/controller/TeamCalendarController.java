package attention.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import attention.mapper.TeamCalendarMapper;
import attention.service.TeamCalendarService;

/*@RestController*/
@CrossOrigin
@Controller
@RequestMapping("/calendar")
public class TeamCalendarController {
   
   @Autowired
   private TeamCalendarService teamCalendarService;
   
   @Autowired
   private TeamCalendarMapper teamCalendarMapper;
   
   @GetMapping("/team")
   public String main() {
      return "calendar/team";
      
   }
   
   @PostMapping("/teamsubmit_pro")
   public String teamsubmit_pro(
         @RequestParam("cal_start_date") String cal_start_date,
         @RequestParam("cal_end_date") String cal_end_date,
         @RequestParam("cal_title") String cal_title,
         @RequestParam("line_name") String line_name,
         @RequestParam("cal_category") String cal_category,
         @RequestParam("cal_content") String cal_content) {
      
      teamCalendarService.teamsaveCalendar(cal_start_date, cal_end_date, cal_title, line_name, cal_category, cal_content);
      
      return "redirect:/calendar/team";
   }
   
   @PostMapping("/teammodify_pro")
   public String teammodify_pro(
         @RequestParam("cal_start_date") String cal_start_date,
            @RequestParam("cal_end_date") String cal_end_date,
            @RequestParam("cal_title") String cal_title,
            @RequestParam("line_name") String line_name,
            @RequestParam("cal_category") String cal_category,
            @RequestParam("cal_content") String cal_content,
            @RequestParam("cal_idx") int cal_idx
            ) {
      
      teamCalendarMapper.teamupdateCalendar(cal_start_date, cal_end_date, cal_title, line_name, cal_category, cal_content,cal_idx);
      return "redirect:/calendar/team";
   }
   
       
}