package attention.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import attention.beans.UserBean;
import attention.mapper.AdminMapper;

@Repository
public class AdminDao {
	
	@Autowired
	private AdminMapper adminMapper;
	
	public List<UserBean> getJoinList(UserBean addEmployeeBean) {
		return adminMapper.getJoinList(addEmployeeBean);
	}
	
	public void deleteJoin(String employee_id) {
		adminMapper.deleteJoin(employee_id);
	}
	
	public void JoinAccept(String employee_id) {
		adminMapper.JoinAccept(employee_id);
	}

}
