package kr.co.soldesk.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soldesk.beans.UserBean;
import kr.co.soldesk.dao.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;


	public void getLoginUserInfo(UserBean tempLoginUserBean) {

		UserBean tempLoginUserBean2 = userDao.getLoginUserInfo(tempLoginUserBean);
		
		if(tempLoginUserBean2 !=null) {
			loginUserBean.setEmployee_id(tempLoginUserBean2.getEmployee_id());
			loginUserBean.setUserLogin(true);
		}
		
	}

}
