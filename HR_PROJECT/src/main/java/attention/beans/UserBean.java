package attention.beans;

import java.sql.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserBean {
	
	@Size(min = 1, max = 10)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String employee_id;

	@Size(min = 2, max = 4)
	@Pattern(regexp = "[가-힣a-zA-Z0-9]*")
	private String employee_name;

	@Size(min = 2, max = 40)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String employee_password;

	@Size(min = 2, max = 40)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String employee_password2;

	private String department_name;
	private String line_name;
	private String employee_position;
	private String employee_email;
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
	private Date update_date;
	private String employee_annual_leave;
	
	private boolean userLogin;
	
	

	public UserBean() {
		this.userLogin = false;
	}

	public boolean isUserLogin() {
		return userLogin;
	}

	public void setUserLogin(boolean userLogin) {
		this.userLogin = userLogin;
	}

}
