package attention.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import attention.beans.UserBean;

public interface UserMapper {

    @Select("select employee_id, employee_name, department_name, line_name, employee_position, employee_annual_leave " +
            "from HRPROJECT.employees " +
            "where employee_id=#{employee_id} and employee_password=#{employee_password}")
    UserBean getLoginUserInfo(UserBean tempLoginUserBean);
    
    @Select("select employee_id, employee_name " +
            "from HRPROJECT.employees " +
            "where employee_id=#{employee_id}")
    UserBean getModifyUserInfo(String employee_id);
    
    @Update("update HRPROJECT.employees set employee_password=#{employee_password}, employee_email=#{employee_email}, employee_phone=#{employee_phone}, employee_address=#{employee_address} where employee_id=#{employee_id}")
    void modifyUserInfo(UserBean modifyUserBean);
    
    @Select("select employee_id, employee_name, department_name, employee_position from HRPROJECT.employees "
          + " where (department_name =#{department_name} and employee_position='팀장') "
          + " or (line_name=#{line_name} and employee_position='차장') "
          + " or (line_name=#{line_name} and employee_position='부장') ")
    List<UserBean> getLookerList(UserBean loginUserBean);
}