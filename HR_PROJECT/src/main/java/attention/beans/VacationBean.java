package attention.beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VacationBean {
   private String employee_name;
   private String vacation_name;
   private String employee_id_ch;
   private String employee_id_ch2;
   private String vacation_start_date;
   private String vacation_end_date;
   private int vacation_days;
   private String vacation_reason;

   public VacationBean() {

   }

}