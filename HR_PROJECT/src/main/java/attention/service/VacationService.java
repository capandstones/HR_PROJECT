package attention.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import attention.beans.VacationBean;
import attention.mapper.VacationMapper;

@Service
public class VacationService {

   @Autowired
   private VacationMapper vacationMapper;

   public void saveVacation(String employee_id, String line_name, String department_name, String employee_position, String vacation_name, String employee_name,
         String employee_id_approver, String employee_id_referrer, String vacation_start_date,
         String vacation_end_date, int vacation_days, String vacation_reason, String vacation_attachment, String vacation_state) {
      VacationBean vacationBean = new VacationBean();

      vacationBean.setEmployee_id(employee_id);
      vacationBean.setLine_name(line_name);
      vacationBean.setLine_name(department_name);
      vacationBean.setLine_name(employee_position);
      vacationBean.setVacation_name(vacation_name);
      vacationBean.setEmployee_name(employee_name);
      vacationBean.setEmployee_id_approver(employee_id_approver);
      vacationBean.setEmployee_id_referrer(employee_id_referrer);
      vacationBean.setVacation_start_date(vacation_start_date);
      vacationBean.setVacation_end_date(vacation_end_date);
      vacationBean.setVacation_days(vacation_days);
      vacationBean.setVacation_reason(vacation_reason);
      vacationBean.setVacation_attachment(vacation_attachment);
      vacationBean.setLine_name(vacation_state);

      vacationMapper.save(vacationBean);

   }

   public List<VacationBean> getUpcomingVacations(String employee_id) {
      return vacationMapper.getUpcomingVacations(employee_id);
   }
   
   public List<VacationBean> getMemberVacations(String employee_id) {
      return vacationMapper.getMemberVacations(employee_id);
   }
   
   public void cancelVacation(int VA_idx) {
       vacationMapper.cancelVacation(VA_idx);
   }

}