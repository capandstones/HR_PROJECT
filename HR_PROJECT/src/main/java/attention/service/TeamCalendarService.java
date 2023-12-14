package attention.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import attention.beans.TeamCalendarBean;
import attention.mapper.TeamCalendarMapper;

@Service
public class TeamCalendarService {

   @Autowired
   private TeamCalendarMapper teamCalendarMapper;
   
   /*
    * @Autowired private CalendarDao calendarDao;
    */
   
   public void teamsaveCalendar(String cal_start_date, String cal_end_date, String cal_title, String line_name, String cal_category, String cal_content) {
      
      TeamCalendarBean teamCalendarBean = new TeamCalendarBean();
  
      teamCalendarBean.setCal_start_date(cal_start_date);
      teamCalendarBean.setCal_end_date(cal_end_date);
      teamCalendarBean.setCal_title(cal_title);
      teamCalendarBean.setLine_name(line_name);
      teamCalendarBean.setCal_category(cal_category);
      teamCalendarBean.setCal_content(cal_content);
      
      
      teamCalendarMapper.teamsaveCalendar(teamCalendarBean);
   }
   
   
    public List<TeamCalendarBean> getCalendarEvents(String line_name) { 
       return teamCalendarMapper.getCalendarTeamEvents(line_name); 
    }
    
   
    

}