package attention.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import attention.beans.EmployeesBean;
import attention.dao.EmployeesDao;

public class EmployeesService {
	
	@Autowired
	private EmployeesDao emoEmployeesDao;
	
	public ArrayList<EmployeesBean> getEmpInfo(String employee_id){
		return emoEmployeesDao.getEmpInfo(employee_id);
	}
	
}
