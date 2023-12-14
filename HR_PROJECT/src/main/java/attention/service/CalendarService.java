package attention.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import attention.beans.CalendarBean;
import attention.mapper.CalendarMapper;

@Service
public class CalendarService {

   @Autowired
   private CalendarMapper calendarMapper;
   
   /*
    * @Autowired private CalendarDao calendarDao;
    */
   
   public void saveCalendar(String cal_start_date, String cal_end_date, String cal_title, String cal_category, String cal_content) {
      
      CalendarBean calendarBean = new CalendarBean();
      calendarBean.setCal_start_date(cal_start_date);
      calendarBean.setCal_end_date(cal_end_date);
      calendarBean.setCal_title(cal_title);
      calendarBean.setCal_category(cal_category);
      calendarBean.setCal_content(cal_content);
      
      calendarMapper.saveCalendar(calendarBean);
   }
   
   
    public List<CalendarBean> getCalendarEvents() { 
       return calendarMapper.getCalendarEvents(); 
    }
    
   
    

}