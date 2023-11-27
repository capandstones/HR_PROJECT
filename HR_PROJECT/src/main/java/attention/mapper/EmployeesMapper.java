package attention.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;

import attention.beans.EmployeesBean;

public interface EmployeesMapper {
	
	 @Select("select employee_name, emp.department_name, department_depth, department_depth_row, emp.employee_phone, emp.employee_status "
	 		+ "from HRPROJECT.employees emp "
	 		+ "inner join department dept "
	 		+ "on emp.employee_id = dept.department_head_id")
	 ArrayList<EmployeesBean> getEmpInfo();
}
