package kr.co.soldesk.beans;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserBean {

	private int employee_id;

	@Size(min=2, max=40)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String employee_password;

	@Size(min=2, max=40)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String employee_password2;

	private boolean userLogin;
	
	public UserBean() {
		this.userLogin=false;
	}

	public boolean isUserLogin() {
		return userLogin;
	}

	public void setUserLogin(boolean userLogin) {
		this.userLogin = userLogin;
	}

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public String getEmployee_password() {
		return employee_password;
	}

	public void setEmployee_password(String employee_password) {
		this.employee_password = employee_password;
	}

	public String getEmployee_password2() {
		return employee_password2;
	}

	public void setEmployee_password2(String employee_password2) {
		this.employee_password2 = employee_password2;
	}

	
}
