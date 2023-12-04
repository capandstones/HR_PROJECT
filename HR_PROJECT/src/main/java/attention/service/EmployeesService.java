package attention.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import attention.beans.EmployeesBean;
import attention.dao.EmployeesDao;

@Service
public class EmployeesService {
   
   @Autowired
   private EmployeesDao employeesDao;
   
   public ArrayList<EmployeesBean> getEmpInfo() {
      return employeesDao.getEmpInfo();
   }
   
}