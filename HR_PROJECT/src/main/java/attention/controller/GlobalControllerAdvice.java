package attention.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import attention.beans.UserBean;

@ControllerAdvice
public class GlobalControllerAdvice {
	

	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

    @ModelAttribute
    public void globalAttributes(Model model, HttpSession session) {
    	
        String username = loginUserBean.getEmployee_name();
        String employee_id = loginUserBean.getEmployee_id();
        
        model.addAttribute("username", username);
        model.addAttribute("employee_id", employee_id);
    }
}
