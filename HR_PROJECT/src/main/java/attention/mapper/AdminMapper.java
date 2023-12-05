package attention.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import attention.beans.UserBean;

public interface AdminMapper {
	
	@Select("select employee_id, employee_name, department_name, employee_email,"
			+ " employee_password,employee_phone,employee_last_name,employee_first_name from HRPROJECT.employees "
    		+ " where employee_position='대기중' ")
    List<UserBean> getJoinList(UserBean addEmployeeBean);
	
	@Delete("delete from HRPROJECT.employees where employee_id=#{employee_id}")
	void deleteJoin(String employee_id);
	
	@Update("update HRPROJECT.employees set employee_position='사원' where employee_id=#{employee_id}")
	void JoinAccept(String employee_id);

}
