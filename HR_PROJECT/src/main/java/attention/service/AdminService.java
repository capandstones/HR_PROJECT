package attention.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import attention.beans.UserBean;
import attention.dao.AdminDao;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;
	
	public List<UserBean> getJoinList(UserBean addEmployeeBean) {
		return adminDao.getJoinList(addEmployeeBean);
	}
	
	public void deleteJoin(String employee_id) {
		adminDao.deleteJoin(employee_id);
	}
	
	public void JoinAccept(String employee_id) {
		adminDao.JoinAccept(employee_id);
	}

}
