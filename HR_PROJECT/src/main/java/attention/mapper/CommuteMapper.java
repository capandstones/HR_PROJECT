package attention.mapper;

import org.apache.ibatis.annotations.Select;

import attention.beans.CommuteBean;

public interface CommuteMapper {

   @Select("SELECT week_work_hour,week_remaining_time, month_work_hour, month_remaining_time FROM HRPROJECT.commute_table WHERE employee_id=#{employee_id} and today=#{today}")
   CommuteBean getWeeklyWorkTime(String employee_id, String today);

}