package attention.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;

import attention.beans.EmployeesBean;

public interface EmployeesMapper {
	
	 @Select("select employee_name, emp.employee_id, emp.department_name, department_depth, department_depth_row "
	 		+ "from employees emp "
	 		+ "inner join department dept "
	 		+ "on emp.employee_id = dept.employee_id "
	 		+ "where emp.employee_id=#{employee_id}")
	 ArrayList<EmployeesBean> getEmpInfo(String employee_id);
}
