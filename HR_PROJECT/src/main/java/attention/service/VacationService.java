package attention.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import attention.beans.VacationBean;
import attention.mapper.VacationMapper;

@Service
public class VacationService {

   @Autowired
   private VacationMapper vacationMapper;

   public void saveVacation(String vacation_name, String employee_name, String employee_id_ch, String employee_id_ch2,
         String vacation_start_date, String vacation_end_date, int vacation_days, String vacation_reason) {

      VacationBean vacationBean = new VacationBean();
      vacationBean.setVacation_name(vacation_name);
      vacationBean.setEmployee_name(employee_name);
      vacationBean.setEmployee_id_ch(employee_id_ch);
      vacationBean.setEmployee_id_ch2(employee_id_ch2);
      vacationBean.setVacation_start_date(vacation_start_date);
      vacationBean.setVacation_end_date(vacation_end_date);
      vacationBean.setVacation_days(vacation_days);
      vacationBean.setVacation_reason(vacation_reason);

      vacationMapper.save(vacationBean);

   }
}