package attention.beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommuteBean {
   
   private String employee_id;
   private String today;
   private String commute_time;
   private String leave_time;
   private String day_work_hour;
   private String week_work_hour;
   private String week_default_time;
   private String week_remaining_time;
   private String month_work_hour;
   private String month_default_time;
   private String month_remaining_time;
   
   public CommuteBean() {

   }

}