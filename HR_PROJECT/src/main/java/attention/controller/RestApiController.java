package attention.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import attention.beans.DraftBean;
import attention.beans.UserBean;
import attention.dao.WorkFlowDao;

@RestController
public class RestApiController {

	@Autowired
	private WorkFlowDao workFlowDao;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	@GetMapping("document/golist/{draft_info_idx}")
	public List<DraftBean> list(@PathVariable int draft_info_idx) {
		
		System.out.println("여기야?");
		
		
		System.out.println("여기야?"+draft_info_idx);
		
		List<DraftBean> list1 = workFlowDao.getContentList(draft_info_idx);
		
		return list1;
	}
	
}
