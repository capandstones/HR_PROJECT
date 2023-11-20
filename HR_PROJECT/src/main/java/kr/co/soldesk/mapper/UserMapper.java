package kr.co.soldesk.mapper;

import org.apache.ibatis.annotations.Select;

import kr.co.soldesk.beans.UserBean;

public interface UserMapper {

    @Select("select \"employee_id\", \"employee_name\" " +
            "from HRPROJECT.\"employees\" " +
            "where \"employee_id\"=#{employee_id} and \"employee_password\"=#{employee_password}")
    UserBean getLoginUserInfo(UserBean tempLoginUserBean);
}