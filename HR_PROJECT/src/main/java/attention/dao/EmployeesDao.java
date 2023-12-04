package attention.dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import attention.beans.EmployeesBean;
import attention.mapper.EmployeesMapper;

@Repository
public class EmployeesDao {

   @Autowired
   private EmployeesMapper employeesMapper;
   
   public ArrayList<EmployeesBean> getEmpInfo() {
      return employeesMapper.getEmpInfo();
   }
}