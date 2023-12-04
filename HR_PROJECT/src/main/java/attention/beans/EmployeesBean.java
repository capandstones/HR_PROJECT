package attention.beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmployeesBean {

   private String employee_id;
   private String department_name;
   private String employee_position;
   private String employee_name;
   private String employee_email;
   private String employee_password;
   private String employee_start_date;
   private String employee_RRN;
   private String employee_end_date;
   private String employee_phone;
   private String employee_address;
   private String employee_self_introduction;
   private String employee_status;
   private String employee_last_name;
   private String employee_first_name;
   private String employee_profile_picture;

   

   public EmployeesBean() {
      
   }



   @Override
   public String toString() {
      return "EmployeesBean [employee_id=" + employee_id + ", department_name=" + department_name
            + ", employee_position=" + employee_position + ", employee_name=" + employee_name + ", employee_email="
            + employee_email + ", employee_password=" + employee_password + ", employee_start_date="
            + employee_start_date + ", employee_RRN=" + employee_RRN + ", employee_end_date=" + employee_end_date
            + ", employee_phone=" + employee_phone + ", employee_address=" + employee_address
            + ", employee_self_introduction=" + employee_self_introduction + ", employee_status=" + employee_status
            + ", employee_last_name=" + employee_last_name + ", employee_first_name=" + employee_first_name
            + ", employee_profile_picture=" + employee_profile_picture + "]";
   }

   
}
