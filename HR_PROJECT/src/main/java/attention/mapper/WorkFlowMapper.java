package attention.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.SelectKey;

import attention.beans.DraftBean;

public interface WorkFlowMapper {
	
	@SelectKey(statement = "select HRPROJECT.draft_seq.nextval from dual", keyProperty = "draft_idx", before = true, resultType = int.class)

	@Insert("insert into HRPROJECT.draft_table(draft_idx, draft_subject, draft_text, "
			+ "draft_file, draft_writer_id, draft_hope_date, draft_date) "
			+ "values (#{draft_idx}, #{draft_subject}, #{draft_text}, #{draft_file, jdbcType=VARCHAR}, "
			+ "#{draft_writer_id}, #{draft_hope_date}, sysdate)")
	void addContentInfo(DraftBean draftContentBean);

}
