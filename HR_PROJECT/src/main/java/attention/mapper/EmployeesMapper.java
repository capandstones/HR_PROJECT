package attention.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import attention.beans.EmployeesBean;

public interface EmployeesMapper {
    
    @Select("select * from HRPROJECT.employees where department_name IS NOT NULL")
    ArrayList<EmployeesBean> getEmpInfo();
    
    @Select("select * from HRPROJECT.employees where employee_id=#{employee_id}")
    EmployeesBean getEmpInfoDetail(String employeeInfoKey);
    
    @Select("select distinct department_line_name from HRPROJECT.department order by department_line_name asc")
    List<String> getDeptLineNameList();
    
    @Select("select department_name from HRPROJECT.department where department_line_name = #{department_line_name}")
    List<String> getDeptNameList(String deptLineName);
}