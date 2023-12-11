package attention.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import attention.beans.DraftBean;
import attention.beans.UserBean;
import attention.dao.TransferDao;
import attention.dao.WorkFlowDao;
import attention.service.WorkFlowService;

@RestController
public class RestApiController {

	@Autowired
	private WorkFlowDao workFlowDao;
	
	@Autowired
	private WorkFlowService workFlowService;
	
	@Autowired
	private TransferDao transferDao;
	
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	@GetMapping("document/golist/{draft_info_idx}")
	public List<DraftBean> list(@PathVariable int draft_info_idx,String employee_id) {
		

		employee_id = loginUserBean.getEmployee_id();
		
		List<DraftBean> list1 = workFlowDao.getContentList(draft_info_idx,employee_id);
		
		return list1;
	}
	
	//DraftBean getContentInfo(int draft_idx);
	@GetMapping("document/getContentInfo/{draft_idx}")
	public DraftBean getContentInfo(@PathVariable int draft_idx) {
		System.out.println("여기야");
		System.out.println(draft_idx);
		DraftBean readDraftBean =workFlowService.getContentInfo(draft_idx);
		System.out.println(readDraftBean.getDraft_text());
		return readDraftBean;
	}
	
	@GetMapping("document/approval/{draft_idx}/{opinion}/{comment}")
	public void changeOpinion(@PathVariable int draft_idx,String employee_id,@PathVariable int opinion,String employee_name,@PathVariable String comment) {	
		System.out.println("들어왔니?");
		System.out.println(draft_idx);
		System.out.println(opinion);
		employee_id = loginUserBean.getEmployee_id();
		employee_name = loginUserBean.getEmployee_name();
		workFlowService.changeOpinion(draft_idx, employee_id, opinion,employee_name,comment);
		workFlowService.checkOpinion(draft_idx);
				
	}
	
	
	@GetMapping("workflow/getlist/{department}")
	public List<UserBean> getAllList(@PathVariable String department) {	


		
		System.out.println("사원목록입니다");
		List<UserBean> emplist = workFlowDao.getAllList(department);
		
		System.out.println(emplist.toString());
		
		return emplist;
	}
	
	@GetMapping("transfer/getinfo/{employee_id}")
	public List<UserBean> getinfo(@PathVariable String employee_id) {	


		List<UserBean> emplist = transferDao.getOneList(employee_id);
		
		
		
		return emplist;
	}
	
	
}
