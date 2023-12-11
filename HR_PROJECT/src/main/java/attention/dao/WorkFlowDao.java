package attention.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import attention.beans.DraftBean;
import attention.beans.UserBean;
import attention.mapper.WorkFlowMapper;

@Repository
public class WorkFlowDao{ 
	
	@Autowired
	private WorkFlowMapper workFlowMapper;
	
	public void addContentInfo(DraftBean draftContentBean) {
		workFlowMapper.addContentInfo(draftContentBean);
	}
	
	public String getDraftInfoName(int draft_info_idx) {
		return workFlowMapper.getDraftInfoName(draft_info_idx);
	}

	public List<DraftBean> getContentList(int draft_info_idx,String employee_id) {
		return workFlowMapper.getContentList(draft_info_idx, employee_id);
	}
	
	public DraftBean getContentInfo(int draft_idx) {
		return workFlowMapper.getContentInfo(draft_idx);
	}
	
	public void changeOpinion(int draft_idx,String employee_id, int opinion,String employee_name,String comment) {
		
		System.out.println("여기는 dao" +employee_id);
		workFlowMapper.changeOpinion(draft_idx,employee_id, opinion,employee_name,comment);
	}
	
	public void checkOpinion(int draft_idx) {
		
		
		workFlowMapper.checkOpinion(draft_idx);
	}
	
	public void addEmployee(UserBean joinBean) {
		workFlowMapper.addEmployee(joinBean);
	}
	
	public List<UserBean> getAllList(String department) {
		return workFlowMapper.getAllList(department);
	}
	
	
}
