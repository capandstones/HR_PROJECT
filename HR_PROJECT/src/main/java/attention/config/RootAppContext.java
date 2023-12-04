package attention.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.annotation.SessionScope;

import attention.beans.DraftBean;
import attention.beans.UserBean;

//프로젝트 작업시 사용할 bean을 정의하는 클래스
@Configuration
public class RootAppContext {
	
	@Bean("loginUserBean")
	@SessionScope
	public UserBean loginUserBean() {
		
		return new UserBean();
	}
	

	@Bean("draftContentBean")
	public DraftBean draftContentBean() {
		
		return new DraftBean();
	}
	   
}