package kr.co.soldesk.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.soldesk.beans.UserBean;

public interface UserMapper {

    @Select("select employee_id, employee_name " +
            "from HRPROJECT.employees " +
            "where employee_id=#{employee_id} and employee_password=#{employee_password}")
    UserBean getLoginUserInfo(UserBean tempLoginUserBean);
    
    @Select("select employee_id, employee_name " +
            "from HRPROJECT.employees " +
            "where employee_id=#{employee_id}")
    UserBean getModifyUserInfo(String employee_id);
    
    @Update("update HRPROJECT.employees set employee_password=#{employee_password} where employee_id=#{employee_id}")
    void modifyUserInfo(UserBean modifyUserBean);
}