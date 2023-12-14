package attention.beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TeamCalendarBean {
   
   private int cal_idx;
   private String line_name;
   private String cal_start_date;
   private String cal_end_date;
   private String cal_title;
   private String cal_color;
   private String cal_content;
   private String cal_category; 
   
   public TeamCalendarBean() {
      // TODO Auto-generated constructor stub
   }
   
   /*
    * public static String formatLocalDateTime(LocalDateTime dateTime) {
    * DateTimeFormatter formatter =
    * DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss"); return
    * dateTime.format(formatter); }
    */
   
}