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
			loginUserBean.setEmployee_name(tempLoginUserBean2.getEmployee_name());
			loginUserBean.setUserLogin(true);
		}
		
	}
	
	public void getModifyUserInfo(UserBean modifyUserBean) {

		   UserBean tempModifyUserBean = userDao.getModifyUserInfo(loginUserBean.getEmployee_id());
		  // System.out.println(tempModifyUserBean.toString());
		   
		   modifyUserBean.setEmployee_id(tempModifyUserBean.getEmployee_id());
		   modifyUserBean.setEmployee_name(tempModifyUserBean.getEmployee_name());
		   modifyUserBean.setEmployee_id(loginUserBean.getEmployee_id());
		
		   
		}

		public void modifyUserInfo(UserBean modifyUserBean) {
			
			modifyUserBean.setEmployee_id(loginUserBean.getEmployee_name());
			
			userDao.modifyUserInfo(modifyUserBean);
		}

}
