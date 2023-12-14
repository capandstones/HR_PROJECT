package attention.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import attention.beans.TeamCalendarBean;

public interface TeamCalendarMapper {
   
   @SelectKey(statement = "SELECT HRPROJECT.team_Calendar_seq.nextval FROM dual", keyProperty = "cal_idx", before = true, resultType = int.class)
   
    @Insert("insert into HRPROJECT.team_Calendar (cal_idx, cal_start_date, cal_end_date, cal_title, line_name, cal_content, cal_category) values (#{cal_idx}, #{cal_start_date}, #{cal_end_date}, #{cal_title}, #{line_name}, #{cal_content}, #{cal_category})") 
    void teamsaveCalendar(TeamCalendarBean teamCalendarBean);
    
    @Select("select cal_idx, cal_start_date, cal_end_date, cal_title, line_name, cal_content, cal_category from HRPROJECT.team_Calendar where line_name = #{line_name}")
    List<TeamCalendarBean> getCalendarTeamEvents(String line_name);
    
    @Update("update HRPROJECT.team_Calendar "
          + "set cal_start_date = #{cal_start_date}, "
          + "    cal_end_date = #{cal_end_date}, "
          + "    cal_title = #{cal_title}, "
          + "    line_name = #{line_name}, "
          + "    cal_content = #{cal_content}, "
          + "    cal_category = #{cal_category} "
          + "where cal_idx = #{cal_idx}")
    void teamupdateCalendar(@Param("cal_start_date") String cal_start_date,@Param("cal_end_date")String cal_end_date,@Param("cal_title")String cal_title,@Param("line_name") String line_name,
          @Param("cal_category") String cal_category,@Param("cal_content") String cal_content,@Param("cal_idx") int cal_idx);

    @Delete("delete from HRPROJECT.team_Calendar where cal_idx = #{eventIdx}")
    void teamDelete(int eventIdx);
    
    


}