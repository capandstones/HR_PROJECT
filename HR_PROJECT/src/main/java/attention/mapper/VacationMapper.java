package attention.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import attention.beans.VacationBean;

public interface VacationMapper {

   @Insert("insert into HRPROJECT.vacation_Application (employee_id, line_name, vacation_name, "
         + "employee_name, employee_id_approver, employee_id_referrer, vacation_start_date, "
         + "vacation_end_date, vacation_days, vacation_reason, vacation_attachment) "
         + "values (#{employee_id}, #{line_name}, "
         + "#{vacation_name}, #{employee_name}, #{employee_id_approver}, #{employee_id_referrer}, "
         + "#{vacation_start_date}, #{vacation_end_date}, #{vacation_days}, #{vacation_reason}, #{vacation_attachment})")
   void save(VacationBean vacationBean);
   
   @Select("select vacation_name, vacation_start_date, vacation_end_date, vacation_comment, vacation_state, VA_idx FROM HRPROJECT.vacation_Application WHERE employee_id=#{employee_id}")
   List<VacationBean> getUpcomingVacations(String employee_id);
   
   @Delete("DELETE FROM HRPROJECT.vacation_Application WHERE VA_idx = #{VA_idx}")
   void cancelVacation(int VA_idx);
   
   @Select("select employee_name, employee_id, employee_position, vacation_start_date, vacation_end_date, vacation_name, vacation_days, vacation_attachment, vacation_state FROM HRPROJECT.vacation_Application WHERE employee_id_approver=#{employee_id}")
   List<VacationBean> getMemberVacations(String employee_id);
}