package attention.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import attention.beans.UserBean;

public interface TransferMapper {

	
	@Select("SELECT * "
			+ " FROM HRPROJECT.employees "
			+ " WHERE department_name IS NOT NULL "
			+ " ORDER BY department_name DESC")
	public List<UserBean> allemplist();

	
}
