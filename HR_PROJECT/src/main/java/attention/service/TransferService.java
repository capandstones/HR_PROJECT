package attention.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import attention.beans.UserBean;
import attention.dao.TransferDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class TransferService {



	@Autowired
	private TransferDao transferDao;



	public List<UserBean> allemplist(){
		return transferDao.allemplist();
	}


}
