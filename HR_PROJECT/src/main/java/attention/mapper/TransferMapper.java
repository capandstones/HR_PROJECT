package attention.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import attention.beans.UserBean;

public interface TransferMapper {

	
	@Select("SELECT * "
			+ " FROM HRPROJECT.employees "
			+ " WHERE department_name IS NOT NULL "
			+ " ORDER BY department_name DESC")
	public List<UserBean> allemplist();


	@Select("select * from HRPROJECT.employees where employee_id=#{employee_id}")
	public List<UserBean> getOneList(String employee_id);
	
	@Update("update HRPROJECT.employees set department_name=#{department_name}, line_name=#{line_name}, employee_position=#{employee_position} where employee_id=#{employee_id}")
	void movingInfo(@Param("employee_id") String employee_id, 
					@Param("department_name") String department_name,
					@Param("line_name") String line_name,
					@Param("employee_position") String employee_position);
	
	@Select("SELECT * "
			+ " FROM HRPROJECT.transfer_history "
			+ " WHERE department_name IS NOT NULL "
			+ " ORDER BY department_name DESC")
	public List<UserBean> allHistory();
}
