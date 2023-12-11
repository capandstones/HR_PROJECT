package attention.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import attention.beans.CalendarBean;

public interface CalendarMapper {
   
   @SelectKey(statement = "SELECT HRPROJECT.team_Calendar_seq.nextval FROM dual", keyProperty = "cal_idx", before = true, resultType = int.class)
   
    @Insert("insert into HRPROJECT.team_Calendar (cal_idx, line_name, cal_start_date, cal_end_date, cal_title, cal_content, cal_category) values (#{cal_idx}, #{line_name}, #{cal_start_date}, #{cal_end_date}, #{cal_title}, #{cal_content}, #{cal_category})") 
    void saveCalendar(CalendarBean calendarBean);
    
    @Select("select cal_idx, cal_start_date, cal_end_date, cal_title, cal_content, cal_category from HRPROJECT.team_Calendar")
    List<CalendarBean> getCalendarEvents();
    
    @Update("update HRPROJECT.team_Calendar "
          + "set line_name = #{line_name}, "
          + "    cal_start_date = TO_DATE(#{cal_start_date}, 'YYYY-MM-DD'), "
          + "    cal_end_date = TO_DATE(#{cal_end_date}, 'YYYY-MM-DD'), "
          + "    cal_title = #{cal_title}, "
          + "    cal_content = #{cal_content}, "
          + "    cal_category = #{cal_category} "
          + "where cal_idx = #{cal_idx}")
    void modifyCalendarInfo(CalendarBean modifyCalendarBean);
    

    @Delete("delete from HRPROJECT.team_Calendar where cal_idx = #{eventIdx}")
    void delete(int eventIdx);
    
    


}