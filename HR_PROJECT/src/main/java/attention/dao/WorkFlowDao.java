package attention.dao;

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

}
