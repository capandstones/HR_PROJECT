package attention.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import attention.beans.CalendarBean;
import attention.mapper.CalendarMapper;

@Repository
public class CalendarDao {
   
   @Autowired
   private CalendarMapper calendarMapper;

   public List<CalendarBean> getCalendarEvents() {
      return calendarMapper.getCalendarEvents();
   }

   public void saveCalendar(CalendarBean calendarBean) {
      calendarMapper.saveCalendar(calendarBean);
   }
}