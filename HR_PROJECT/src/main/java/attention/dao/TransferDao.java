package attention.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import attention.beans.UserBean;
import attention.mapper.TransferMapper;

@Repository
public class TransferDao{ 
	
	@Autowired
	private TransferMapper transferMapper;
	
	public List<UserBean> allemplist(){
		return transferMapper.allemplist();
	}
	
	public List<UserBean> getOneList(String employee_id){
				
		return transferMapper.getOneList(employee_id);
	}
	
	
}
