package attention.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import attention.mapper.CalendarMapper;
import attention.service.CalendarService;

/*@RestController*/
@CrossOrigin
@Controller
@RequestMapping("/calendar")
public class CalendarController {
   
   @Autowired
   private CalendarService calendarService;
   
   @Autowired
   private CalendarMapper calendarMapper;
   
   @GetMapping("/main")
   public String main() {
      return "calendar/main";
      
   }
   
   @PostMapping("/submit_pro")
   public String submit_pro(
         @RequestParam("cal_start_date") String cal_start_date,
         @RequestParam("cal_end_date") String cal_end_date,
         @RequestParam("cal_title") String cal_title,
         @RequestParam("cal_category") String cal_category,
         @RequestParam("cal_content") String cal_content) {
      
      calendarService.saveCalendar(cal_start_date, cal_end_date, cal_title, cal_category, cal_content);
      
      return "redirect:/calendar/main";
   }
   
   @PostMapping("/modify_pro")
   public String modify_pro(
         @RequestParam("cal_start_date") String cal_start_date,
            @RequestParam("cal_end_date") String cal_end_date,
            @RequestParam("cal_title") String cal_title,
            @RequestParam("cal_category") String cal_category,
            @RequestParam("cal_content") String cal_content,
            @RequestParam("cal_idx") int cal_idx
            ) {
      
      calendarMapper.updateCalendar(cal_start_date, cal_end_date, cal_title, cal_category, cal_content,cal_idx);
      return "redirect:/calendar/main";
   }
   
       
}