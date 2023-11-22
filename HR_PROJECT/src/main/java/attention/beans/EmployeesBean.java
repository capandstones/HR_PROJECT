package attention.beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmployeesBean {

	private String employee_id;
	private String department_name;
	private String rank_num;
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

	
	public EmployeesBean(String employee_id, String department_name, String rank_num, String employee_name,
			String employee_email, String employee_password, String employee_start_date, String employee_RRN,
			String employee_end_date, String employee_phone, String employee_address, String employee_self_introduction,
			String employee_status, String employee_last_name, String employee_first_name,
			String employee_profile_picture) {
		this.employee_id = employee_id;
		this.department_name = department_name;
		this.rank_num = rank_num;
		this.employee_name = employee_name;
		this.employee_email = employee_email;
		this.employee_password = employee_password;
		this.employee_start_date = employee_start_date;
		this.employee_RRN = employee_RRN;
		this.employee_end_date = employee_end_date;
		this.employee_phone = employee_phone;
		this.employee_address = employee_address;
		this.employee_self_introduction = employee_self_introduction;
		this.employee_status = employee_status;
		this.employee_last_name = employee_last_name;
		this.employee_first_name = employee_first_name;
		this.employee_profile_picture = employee_profile_picture;
	}


	public EmployeesBean() {
		
	}

}
