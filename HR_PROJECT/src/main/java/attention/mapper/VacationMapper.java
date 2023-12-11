package attention.mapper;

import org.apache.ibatis.annotations.Insert;

import attention.beans.VacationBean;

public interface VacationMapper {

   @Insert("insert into HRPROJECT.vacation_Application (employee_id, line_name, vacation_name, "
         + "employee_name, employee_id_approver, employee_id_referrer, vacation_start_date, "
         + "vacation_end_date, vacation_days, vacation_reason, vacation_attachment) "
         + "values (#{employee_id}, #{line_name}, "
         + "#{vacation_name}, #{employee_name}, #{employee_id_approver}, #{employee_id_referrer}, "
         + "#{vacation_start_date}, #{vacation_end_date}, #{vacation_days}, #{vacation_reason}, #{vacation_attachment})")
   void save(VacationBean vacationBean);

}