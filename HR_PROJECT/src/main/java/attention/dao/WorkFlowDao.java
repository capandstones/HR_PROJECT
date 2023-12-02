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

	public List<DraftBean> getContentList(int draft_info_idx) {
		return workFlowMapper.getContentList(draft_info_idx);
	}
	
}
