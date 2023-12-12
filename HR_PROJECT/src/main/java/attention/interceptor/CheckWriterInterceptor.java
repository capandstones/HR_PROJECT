package attention.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import attention.beans.NoticeContentBean;
import attention.beans.UserBean;
import attention.service.NoticeService;

public class CheckWriterInterceptor implements HandlerInterceptor{
	
	private UserBean loginUserBean;
	private NoticeService noticeService;
	
	
	public CheckWriterInterceptor(UserBean loginUserBean, NoticeService noticeService) {
		
		this.loginUserBean = loginUserBean;
		this.noticeService = noticeService;
	}


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		String str1 = request.getParameter("content_idx");
		int content_idx = Integer.parseInt(str1);
		// ���� �Խñ� ���� ��������
		NoticeContentBean currentContentBean = noticeService.getContentInfo(content_idx);
		
		if(currentContentBean.getContent_writer_id() != loginUserBean.getEmployee_id()) {
			String contentPath = request.getContextPath();
			response.sendRedirect(contentPath+"/board/not_writer");
			return false;
		}
		
		return true;
	}
	
	
	
	

}
