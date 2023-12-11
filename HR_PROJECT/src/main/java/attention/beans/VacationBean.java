package attention.beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VacationBean {
   
   private String VA_idx;
   private String employee_id;
   private String line_name;
   private String employee_name;
   private String vacation_name;
   private String employee_id_approver;
   private String employee_id_referrer;
   private String vacation_start_date;
   private String vacation_end_date;
   private int vacation_days;
   private String vacation_reason;
   private String vacation_attachment;
   
   public VacationBean() {

   }

}