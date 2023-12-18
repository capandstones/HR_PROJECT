package attention.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import attention.beans.UserBean;
import attention.beans.VacationBean;

public interface VacationMapper {

   @Insert("insert into HRPROJECT.vacation_Application (employee_id, line_name, department_name, employee_position, vacation_name, "
         + "employee_name, employee_id_approver, employee_id_referrer, vacation_start_date, vacation_end_date, "
         + "vacation_days, vacation_reason, vacation_attachment, vacation_state) "
         + "values (#{employee_id}, #{line_name}, #{department_name}, #{employee_position}, #{vacation_name}, "
         + "#{employee_name}, #{employee_id_approver}, #{employee_id_referrer}, #{vacation_start_date}, #{vacation_end_date}, "
         + "#{vacation_days}, #{vacation_reason}, #{vacation_attachment}, #{vacation_state})")
   void save(VacationBean vacationBean);

   @Select("select vacation_name, vacation_start_date, vacation_end_date, vacation_comment, vacation_state, va_idx FROM HRPROJECT.vacation_Application WHERE employee_id=#{employee_id}")
   List<VacationBean> getUpcomingVacations(String employee_id);

   @Select("select vacation_name, vacation_start_date, vacation_end_date, vacation_comment, vacation_state, va_idx FROM HRPROJECT.vacation_Application_check WHERE employee_id=#{employee_id}")
   List<VacationBean> getVacationHistory(String employee_id);

   @Delete("DELETE FROM HRPROJECT.vacation_Application WHERE va_idx = #{va_idx}")
   void cancelVacation(int va_idx);

   @Select("select employee_name, employee_id, employee_position, vacation_start_date, vacation_end_date, vacation_name, vacation_days, vacation_attachment, vacation_reason, vacation_state, va_idx FROM HRPROJECT.vacation_Application WHERE (employee_id_approver=#{employee_id}) OR (employee_id_approver=#{employee_name} AND line_name=#{line_name})")
   List<VacationBean> getMemberVacations(@Param("employee_id") String employee_id, @Param("employee_name") String employee_name, @Param("line_name") String line_name);

   @Select("select employee_name, employee_id, department_name, employee_position, employee_annual_leave FROM HRPROJECT.employees WHERE line_name=#{line_name}")
   List<UserBean> getMemberVacationList(String line_name);

   @Update("update HRPROJECT.vacation_Application set vacation_state=#{vacation_state} where va_idx=#{va_idx}")
   void rejectVacation(@Param("va_idx") String va_idx, @Param("vacation_state") String vacation_state);
   
   @Update("update HRPROJECT.vacation_Application set vacation_state=#{vacation_state} where va_idx=#{va_idx}")
   void approveVacation(@Param("va_idx") String va_idx, @Param("vacation_state") String vacation_state);
   
   @Select("SELECT * FROM HRPROJECT.vacation_Application_check WHERE va_idx = #{va_idx}")
   VacationBean getVacationApplication(String va_idx);
   
   @Insert("INSERT INTO HRPROJECT.vacation_Application_check SELECT * FROM HRPROJECT.vacation_Application WHERE va_idx = #{va_idx}")
   void archiveVacation(String va_idx);

   @Delete("DELETE FROM HRPROJECT.vacation_Application WHERE va_idx = #{va_idx}")
   void deleteVacation(String va_idx);
   
   @Update("UPDATE HRPROJECT.employees SET employee_annual_leave = employee_annual_leave - #{vacation_days} WHERE employee_id = #{employee_id}")
   void updateAnnualLeave(@Param("employee_id") String employee_id, @Param("vacation_days") int vacation_days);

}