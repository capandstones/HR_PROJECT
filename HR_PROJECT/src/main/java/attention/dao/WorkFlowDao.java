package attention.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import attention.beans.DraftBean;
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
	
	public void changeOpinion(int draft_info_idx,String employee_id, int opinion) {
		workFlowMapper.changeOpinion(draft_info_idx,employee_id, opinion);
	}
	
}
