package attention.mapper;

import org.apache.ibatis.annotations.Insert;

import attention.beans.VacationBean;

public interface VacationMapper {
   
   @Insert("insert into HRPROJECT.vacation_Application_check (vacation_name, employee_name, employee_id_ch, "
         + "employee_id_ch2, vacation_start_date, vacation_end_date, vacation_days, vacation_reason) "
         + "values (#{vacation_name}, #{employee_name}, #{employee_id_ch}, #{employee_id_ch2}, "
         + "#{vacation_start_date}, #{vacation_end_date}, #{vacation_days}, #{vacation_reason})")
   void save(VacationBean vacationBean);

}