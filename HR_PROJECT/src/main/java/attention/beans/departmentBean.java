package attention.beans;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class departmentBean {
	
	private int department_id;
	private String department_name;
	private String department_line_namme;
	
	public departmentBean() {}
	
	public departmentBean(int department_id, String department_name, String department_line_namme) {
		this.department_id = department_id;
		this.department_name = department_name;
		this.department_line_namme = department_line_namme;
	}
	
	
}
