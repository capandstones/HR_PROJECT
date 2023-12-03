package attention.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;

import attention.beans.EmployeesBean;

public interface EmployeesMapper {
	 
	 @Select("select * from HRPROJECT.employees")
	 ArrayList<EmployeesBean> getEmpInfo();
	 
	 @Select("select * from HRPROJECT.employees where employee_id=#{employee_id}")
	 EmployeesBean getEmpInfoDetail(String employeeInfoKey);
	 
}