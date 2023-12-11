package attention.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import attention.beans.CalendarBean;
import attention.beans.DraftBean;
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
   

   @PostMapping("/updateEvent")
   public ResponseEntity<String> updateEvent(@RequestBody CalendarBean modifiedEventDetails) {
      try {
         calendarService.modifyCalendarInfo(modifiedEventDetails);
         return new ResponseEntity<>("success", HttpStatus.OK);
      } catch (Exception e) {
         e.printStackTrace();
          return new ResponseEntity<>("error", HttpStatus.INTERNAL_SERVER_ERROR);
      }
   }
   
   @GetMapping("deleteEvent/{eventIdx}")
	public void delete(@PathVariable int eventIdx) {
		
		calendarMapper.delete(eventIdx);
	}
   
   /*
    * @PostMapping("/calendar/main/delete/{cal_idx}") public String
    * deleteCalendarInfo(@PathVariable int cal_idx) {
    * calendarService.deleteCalendarInfo(cal_idx); return
    * "redirect:/calendar/main"; // 삭제 후 메인 화면으로 이동 }
    */
   
   /*
    * @PostMapping("/calendar/main/delete") public String
    * deleteCalendarInfo(@RequestBody Map<String, Object> payload) { int cal_idx =
    * (int) payload.get("cal_idx"); calendarService.deleteCalendarInfo(cal_idx);
    * return "redirect:/calendar/main"; }
    */
   
   /*
    * @PostMapping("/calendar/events") public String
    * delete(@RequestParam("cal_idx") int cal_idx, Model model) {
    * 
    * calendarService.deleteCalendarInfo(cal_idx); model.addAttribute("cal_idx",
    * cal_idx);
    * 
    * return "calendar/main"; }
    */

}