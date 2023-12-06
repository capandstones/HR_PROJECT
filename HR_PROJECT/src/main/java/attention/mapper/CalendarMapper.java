package attention.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import attention.beans.CalendarBean;

public interface CalendarMapper {
   
   
    @Insert("insert into HRPROJECT.team_Calendar (line_name, cal_start_date, cal_end_date, cal_title, cal_content, cal_category) values (#{line_name}, #{cal_start_date}, #{cal_end_date}, #{cal_title}, #{cal_content}, #{cal_category})"
    ) void saveCalendar(CalendarBean calendarBean);
    
    @Select("select cal_title, cal_start_date, cal_end_date from HRPROJECT.team_Calendar")
    List<CalendarBean> getCalendarEvents();
}