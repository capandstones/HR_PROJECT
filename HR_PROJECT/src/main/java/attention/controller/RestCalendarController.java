package attention.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import attention.beans.CalendarBean;
import attention.mapper.CalendarMapper;
import attention.service.CalendarService;

@RestController
public class RestCalendarController {
   
   @Autowired
   private CalendarService calendarService;
   @Autowired
   private CalendarMapper calendarMapper;
   
   
   @PostMapping("/main/events")
    public List<CalendarBean> getCalendarEvents() { 
       return calendarService.getCalendarEvents(); 
   }
   
   @GetMapping("deleteEvent/{eventIdx}")
   public void delete(@PathVariable int eventIdx) {
      
      calendarMapper.delete(eventIdx);
   }
   
}