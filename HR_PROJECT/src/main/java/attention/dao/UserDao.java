package attention.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import attention.beans.UserBean;
import attention.mapper.UserMapper;

@Repository
public class UserDao {
	
	@Autowired
	private UserMapper userMapper;
	

	public UserBean getLoginUserInfo(UserBean tempLoginUserBean) {
		
		return userMapper.getLoginUserInfo(tempLoginUserBean);
	}
	
	
	public UserBean getModifyUserInfo(String employee_id) {
		
		return userMapper.getModifyUserInfo(employee_id);
	}

	public void modifyUserInfo(UserBean modifyUserBean) {
		userMapper.modifyUserInfo(modifyUserBean);
	}
	
	public List<UserBean> getLookerList(UserBean loginUserBean){
		System.out.println(userMapper.getLookerList(loginUserBean));
		return userMapper.getLookerList(loginUserBean);
	}

}
