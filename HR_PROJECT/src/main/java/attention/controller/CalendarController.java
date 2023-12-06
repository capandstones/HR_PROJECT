package attention.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import attention.beans.CalendarBean;
import attention.service.CalendarService;

/*@RestController*/
@Controller
@RequestMapping("/calendar")
public class CalendarController {
   
   @Autowired
   private CalendarService calendarService;
   
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
         @RequestParam("line_name") String line_name,
         @RequestParam("cal_content") String cal_content) {
      
      calendarService.saveCalendar(cal_start_date, cal_end_date, cal_title, cal_category,
            line_name, cal_content);
      
      return "redirect:/calendar/main";
   }
   
   /*
    * @ResponseBody public List<CalendarBean> showCalendar(Model model) {
    * List<CalendarBean> events = calendarService.getCalendarEvents();
    * //model.addAttribute("calendarEvents", events); return events; }
    */
   
   @GetMapping("/events")
   @ResponseBody
   public List<CalendarBean> getCalendarEvents() {
      return calendarService.getCalendarEvents();
   }
   
}