package attention.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import attention.beans.DraftBean;
import attention.mapper.WorkFlowMapper;
import kr.co.soldesk.beans.ContentBean;

@Repository
public class WorkFlowDao{ 
	
	@Autowired
	private WorkFlowMapper workFlowMapper;
	
	public void addContentInfo(DraftBean draftContentBean) {
		workFlowMapper.addContentInfo(draftContentBean);
	}
	
	public List<DraftBean> getContentList() {
		return WorkFlowMapper.getContentList(board_info_idx, rowBounds);
	}
	
}
