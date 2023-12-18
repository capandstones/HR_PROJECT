package attention.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import attention.beans.UserBean;
import attention.beans.VacationBean;
import attention.mapper.UserMapper;
import attention.mapper.VacationMapper;

@Service
public class VacationService {

   @Autowired
   private VacationMapper vacationMapper;
   
   @Autowired
   private UserMapper userMapper;

   public void saveVacation(String employee_id, String line_name, String department_name, String employee_position,
         String vacation_name, String employee_name, String employee_id_approver, String employee_id_referrer,
         String vacation_start_date, String vacation_end_date, int vacation_days, String vacation_reason,
         String vacation_attachment, String vacation_state) {
      VacationBean vacationBean = new VacationBean();

      vacationBean.setEmployee_id(employee_id);
      vacationBean.setLine_name(line_name);
      vacationBean.setDepartment_name(department_name);
      vacationBean.setEmployee_position(employee_position);
      vacationBean.setVacation_name(vacation_name);
      vacationBean.setEmployee_name(employee_name);
      vacationBean.setEmployee_id_approver(employee_id_approver);
      vacationBean.setEmployee_id_referrer(employee_id_referrer);
      vacationBean.setVacation_start_date(vacation_start_date);
      vacationBean.setVacation_end_date(vacation_end_date);
      vacationBean.setVacation_days(vacation_days);
      vacationBean.setVacation_reason(vacation_reason);
      vacationBean.setVacation_attachment(vacation_attachment);
      vacationBean.setVacation_state(vacation_state);

      vacationMapper.save(vacationBean);

   }

   public List<VacationBean> getUpcomingVacations(String employee_id) {
      return vacationMapper.getUpcomingVacations(employee_id);
   }

   public List<VacationBean> getVacationHistory(String employee_id) {
      return vacationMapper.getVacationHistory(employee_id);
   }

   public List<VacationBean> getMemberVacations(String employee_id, String employee_name, String line_name) {
      return vacationMapper.getMemberVacations(employee_id, employee_name, line_name);
   }

   public void cancelVacation(int va_idx) {
      vacationMapper.cancelVacation(va_idx);
   }

   public List<UserBean> getMemberVacationList(String line_name) {
      return vacationMapper.getMemberVacationList(line_name);
   }

   public void rejectVacation(String va_idx, String vacation_state) {
      vacationMapper.rejectVacation(va_idx, vacation_state);
   }

   @Transactional
    public void approveVacation(String va_idx, String vacation_state) {
        vacationMapper.approveVacation(va_idx, vacation_state);
        vacationMapper.archiveVacation(va_idx);
        vacationMapper.deleteVacation(va_idx);

        VacationBean vacation = vacationMapper.getVacationApplication(va_idx);
        int vacation_days = vacation.getVacation_days();
        String employee_id = vacation.getEmployee_id();

        vacationMapper.updateAnnualLeave(employee_id, vacation_days);
    }
}