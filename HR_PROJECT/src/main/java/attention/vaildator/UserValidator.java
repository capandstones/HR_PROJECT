package attention.vaildator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import attention.beans.UserBean;

public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return UserBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		UserBean userBean = (UserBean) target;
		
		String beanName = errors.getObjectName();

		// 회원가입과 마이페이지에서 동작하도록 설정
		if (beanName.equals("modifyUserBean")) {
			if (userBean.getEmployee_password().equals(userBean.getEmployee_password2()) == false) {
				errors.rejectValue("employee_password", "NotEquals");
				errors.rejectValue("employee_password2", "NotEquals");
			}
		}
	
	}
}
